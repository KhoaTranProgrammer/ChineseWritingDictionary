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
 * This file implements of class drawing Chinese Character by strokes         *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Oct-04-2021: Initial version                                               *
 *              - Read data/character list/header                             *
 *              - Convert stroke to QImage with/without Accumulate            *
 *              - Set of slot and internal to process display strokes         *
 *****************************************************************************/

#include "CWD_WritingCharacter.h"

CWD_WritingCharacter::CWD_WritingCharacter()
{
    // Init QImage
    mAccumImage = new QImage(mWidth, mHeight, QImage::Format_RGB32);

    mData.setFileName(":res/raw/data");

    QFile reader(":res/raw/chars.txt");
    try {
        if(!reader.open(QIODevice::ReadOnly)) {
#if CWD_DEBUG
            qDebug() << "error: " << reader.errorString();
#endif
        } else {
            QTextStream in(&reader);
            mListOfChars = in.readLine();
            reader.close();
        }
    } catch(...) {
        reader.close();
    }

    QFile header(":res/raw/header");
    try {
        if(!header.open(QIODevice::ReadOnly)) {
#if CWD_DEBUG
            qDebug() << "error: " << header.errorString();
#endif
        } else {
            int offset = 0;
            mIncrement = 0;
            while(!header.atEnd())
            {
                char file_data;
                header.read(&file_data, sizeof(char));

                // do something with 'file_data'.
                mSymbols[mIncrement] = (int)file_data;
                mImageOffset[mIncrement] = offset;
                offset += (int)file_data;
                mIncrement++;
            }
            header.close();
        }
        header.close();
    } catch(...) {
        header.close();
    }
}

QImage CWD_WritingCharacter::convertSymbolToQImage()
{
    quint8** bin_image = mImageList.at(mCurInx);
    convertBin2Byte(bin_image[mCurCharSymInx]);
    QImage image(mWidth, mHeight, QImage::Format_RGB32);

    // Init image
    for (int i = 0; i < mHeight; i++)
    {
        for (int j = 0; j < mWidth; j++)
        {
            image.setPixel(j, i, QColor(255, 255, 255).rgb());
        }
    }

    // Create data
    for (int i = 0; i < mHeight; i++)
    {
        for (int j = 0; j < mWidth; j++)
        {
            if ( pic[i][j] == 128) {
                image.setPixel(j, i, QColor(0, 0, 0).rgb());
                image.setPixel(j, i + 1, QColor(0, 0, 0).rgb());
                image.setPixel(j, i - 1, QColor(0, 0, 0).rgb());

                image.setPixel(j - 1, i, QColor(0, 0, 0).rgb());
                image.setPixel(j - 1, i + 1, QColor(0, 0, 0).rgb());
                image.setPixel(j - 1, i - 1, QColor(0, 0, 0).rgb());

                image.setPixel(j + 1, i, QColor(0, 0, 0).rgb());
                image.setPixel(j + 1, i + 1, QColor(0, 0, 0).rgb());
                image.setPixel(j + 1, i - 1, QColor(0, 0, 0).rgb());
            }
        }
    }

    return image;
}

QImage CWD_WritingCharacter::convertSymbolToAccumQImage()
{
    quint8** bin_image = mImageList.at(mCurInx);
    convertBin2Byte(bin_image[mCurCharSymInx]);
    for (int i = 0; i < mHeight; i++)
    {
        for (int j = 0; j < mWidth; j++)
        {
            if ( pic[i][j] == 128) {
                mAccumImage->setPixel(j, i, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j, i + 1, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j, i - 1, QColor(0, 0, 0).rgb());

                mAccumImage->setPixel(j - 1, i, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j - 1, i + 1, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j - 1, i - 1, QColor(0, 0, 0).rgb());

                mAccumImage->setPixel(j + 1, i, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j + 1, i + 1, QColor(0, 0, 0).rgb());
                mAccumImage->setPixel(j + 1, i - 1, QColor(0, 0, 0).rgb());
            }
        }
    }

    return *mAccumImage;
}

void CWD_WritingCharacter::nextSymbol()
{
    // Increase to next symbol
    mCurCharSymInx++;
    if (mCurCharSymInx == mCurCharSym)
    {
        mCurCharSymInx = 0;
        mOnePass = true;

        // Reset Accump Image
        resetAccumImage();
    }
}

quint8 CWD_WritingCharacter::getCurrentSymbolIndex()
{
    return mCurCharSymInx;
}

bool CWD_WritingCharacter::getOnePass()
{
    return mOnePass;
}

// characters: 罗米欧与朱丽叶
void CWD_WritingCharacter::readAllCharacters(QString characters)
{
    removeAllCharacters();
    mOutputString = "";

    try {
        if(!mData.open(QIODevice::ReadOnly)) {
            qDebug() << "error: " << mData.errorString();
        } else {
            for(int x = 0; x < characters.length(); x++)
            {
                QString temp = "";
                temp += characters.at(x);

                if(!mOutputString.contains(temp)) //check input character appears in output string or not. Purpose to recude the multi apprearance
                {
                    readSymbolsOfOneCharacter(temp);
                }
            }
            mData.close();
        }
    } catch(...) {
        mData.close();
    }
}

QString CWD_WritingCharacter::getCharacters()
{
    return mOutputString;
}

void CWD_WritingCharacter::convertBin2Byte(quint8* bin_symbol)
{
    int row = 0;
    int col = 0;
    for(int i = 0; i < mWidth*mHeight/8; i++)
    {
        quint8 a = bin_symbol[i];
        for(int j = 0; j < 8; j++)
        {
            if((a&128) == 128){
                pic[row][col++] = 128;
            }else{
                pic[row][col++] = 0;
            }
            a = (quint8)(a << 1);
        }

        if(col % mWidth == 0){
            col = 0;
            row++;
        }
    }
}

void CWD_WritingCharacter::readSymbolsOfOneCharacter(QString character)
{
    int temp_pos = mListOfChars.indexOf(character); //check input character appears in list of supported character or not
    if(temp_pos != -1)
    {
        /* appear */
        int symbols = mSymbols[temp_pos]; qDebug() << symbols;

        quint8** bin_image = (quint8**)malloc(symbols * sizeof(quint8*)); //the length of symbol in bit unit
        for (int i = 0; i < symbols; i++)
        {
            bin_image[i] = (quint8*)malloc(sizeof(quint8) * ((mWidth * mHeight) / 8));
        }

        // Seek to correct position of character in file
        mData.seek(mImageOffset[temp_pos] * ((mWidth * mHeight) / 8)); qDebug() << mImageOffset[temp_pos];

        // Read all symbols of 1 character
        for (int j = 0; j < symbols; j++)
        {
            mData.read((char*)bin_image[j], ((mWidth * mHeight) / 8));
        }

        mOutputPosition.append(temp_pos);
        mImageList.append(bin_image);
        mOutputString.append(character);
    }
}

void CWD_WritingCharacter::freeSymbolsOfOneCharacter(quint8** bin_image, quint32 position)
{
    int symbols = mSymbols[position];

    for (int i = 0; i < symbols; i++)
    {
        free(bin_image[i]);
    }
    free(bin_image);
}

void CWD_WritingCharacter::removeAllCharacters()
{
    for (int i = 0; i < mImageList.size(); i++)
    {
        freeSymbolsOfOneCharacter(mImageList.at(i), mOutputPosition.at(i));
    }
    mImageList.clear();
    mOutputPosition.clear();
}

void CWD_WritingCharacter::resetAccumImage()
{
    for (int i = 0; i < mHeight; i++)
    {
        for (int j = 0; j < mWidth; j++)
        {
            mAccumImage->setPixel(j, i, QColor(255, 255, 255).rgb());
        }
    }
}

void CWD_WritingCharacter::drawForOneCharacter(QString character)
{
    // Find character is available in output string
    int temp_pos = mOutputString.indexOf(character);
    if(temp_pos != -1)
    {
        mCurChar = character;
        mCurCharSym = mSymbols[mOutputPosition.at(temp_pos)];
        mCurCharSymInx = 0;
        mCurInx = temp_pos;
        mOnePass = false;

        // Reset Accump Image
        resetAccumImage();
    }
}
