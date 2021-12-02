/*
 * MIT License
 *
 * Copyright (c) 2021 KhoaTran Programmer
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
 * This file contains header of Hanzi Character Detection                     *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Function readSampleData/detectCharacters                    *
 *****************************************************************************/

#ifndef CWD_CHARACTERDETECTION_H
#define CWD_CHARACTERDETECTION_H

#include <QObject>

class CWD_CharacterDetection : public QObject
{
    Q_OBJECT
public:
    CWD_CharacterDetection();

public slots:
    // Input Example: 0,12,0,0,11,0,23,27,24
    QString detectCharacters(QString input);

private:
    void readSampleData();
    struct CharacterSet
    {
        QString character;
        uint32_t number_of_stroke;
        uint32_t width;
        uint32_t height;
        int area_data[9];
    };
    QList<CharacterSet> list_characters;
};

#endif // CWD_CHARACTERDETECTION_H
