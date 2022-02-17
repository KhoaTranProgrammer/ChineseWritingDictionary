/*
 * MIT License
 *
 * Copyright (c) 2022 KhoaTran Programmer
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
 * This file contains implementation of Radical processing                    *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Feb-14-2022: Initial version                                               *
 *              - Get Radical from input character                            *
 *****************************************************************************/

#include "CWD_Radical.h"
#include <QFile>
#include <QByteArray>
#include <QDir>
#include <QTextStream>

CWD_Radical::CWD_Radical()
{
    QFile reader(":res/raw/radical.txt");
    reader.open(QIODevice::ReadOnly);
    QTextStream in(&reader);
    while (!in.atEnd())
    {
        QString line = in.readLine();
        QStringList strings = line.split(",");

        CharacterSet cha_data;
        cha_data.character = strings[0];
        cha_data.radical = strings[1];

        // Add 1 set of data to Character Set
        list_characters.append(cha_data);
    }
    reader.flush();
    reader.close();
}

QString CWD_Radical::getRadical(QString input)
{
    QString res = "";

    // Loop all of Character Set
    for(int index = 0; index < list_characters.size(); index++)
    {
        CharacterSet dataSet = list_characters.at(index);

        if (input == dataSet.character) res = dataSet.radical;
    }
    return res;
}
