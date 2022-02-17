/*
 * MIT License
 *
 * Copyright (c) 2021-2022 KhoaTran Programmer
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

/******************************************************************************
 * PURPOSE                                                                    *
 ******************************************************************************
 * This file contains header of drawing Chinese Character by strokes          *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Oct-04-2021: Initial version                                               *
 *              - Read data/character list/header                             *
 *              - Convert stroke to QImage with/without Accumulate            *
 *              - Set of slot and internal to process display strokes         *
 * [1.0.1]                                                                    *
 * Feb-17-2022: Support Display Radical And Number Of Strokes For Character   *
 *              - Add getStrokes to get the number of stroke of 1 character   *
 *****************************************************************************/

#ifndef CWD_WRITINGCHARACTER_H
#define CWD_WRITINGCHARACTER_H

#include <QObject>
#include <QList>
#include <QColor>
#include <QPainter>
#include <QImage>
#include <QFile>
#include <QTextStream>

#if CWD_DEBUG
#include <QDebug>
#endif

class CWD_WritingCharacter : public QObject
{
    Q_OBJECT
public:
    // Read character(res/raw/chars.txt) and header(res/raw/header)
    CWD_WritingCharacter();

public slots:
    // Convert 1 stroke to QImage to display on GUI
    QImage convertSymbolToQImage();

    // Convert 1 stroke with combination old strokes to QImage to display on GUI
    QImage convertSymbolToAccumQImage();

    // Read data of all input characters
    void readAllCharacters(QString characters);

    // Get the list of characters will be supported to draw
    QString getCharacters();

    // Draw setting base on input character
    void drawForOneCharacter(QString character);

    // Get the next symbol of 1 character
    void nextSymbol();

    // Get the current position of symbol in 1 character
    quint8 getCurrentSymbolIndex();

    // Get the status when 1 character finish drawing
    bool getOnePass();

    // Get the number of stroke of 1 character
    quint8 getStrokes(QString character);

private:
    void convertBin2Byte(quint8* bin_symbol);
    void readSymbolsOfOneCharacter(QString character);
    void freeSymbolsOfOneCharacter(quint8** bin_image, quint32 position);
    void removeAllCharacters();
    void resetAccumImage();

    // Image data of characters list - each character has one image data collection
    const static int mWidth = 112;
    const static int mHeight = 112;
    QVector<quint8**> mImageList;
    QList<quint32> mOutputPosition;
    QString mOutputString;
    QString mListOfChars; //characters list
    int mSymbols[7000]; // array to store the number of symbols in 1 character
    int mImageOffset[7000]; // array to store the correct index of character
    int mIncrement = 0; // Number of characters
    quint8 pic[mWidth][mHeight]; // Internal 2D array use for convertBin2Byte
    QFile mData;

    // For current drawing character
    QString mCurChar;
    quint32 mCurCharSym;
    quint32 mCurCharSymInx;
    quint32 mCurInx;
    bool mOnePass;
    QImage* mAccumImage;
};

#endif // CWD_WRITINGCHARACTER_H
