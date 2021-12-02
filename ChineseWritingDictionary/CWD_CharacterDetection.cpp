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
 * This file implement for header of Hanzi Character Detection                *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Function readSampleData/detectCharacters                    *
 *****************************************************************************/

#include <QDebug>
#include <QFile>
#include <QByteArray>
#include <QDir>
#include <QDataStream>
#include "CWD_CharacterDetection.h"

CWD_CharacterDetection::CWD_CharacterDetection()
{
    readSampleData();
}

void CWD_CharacterDetection::readSampleData()
{
    QFile reader(":res/raw/chinese_letter.data");
    reader.open(QIODevice::ReadOnly);
    QTextStream in(&reader);
    while (!in.atEnd())
    {
        QString line = in.readLine();
        QStringList strings = line.split(",");

        CharacterSet cha_data;
        cha_data.character = strings[0];

        QString str_width = strings[2];
        QString str_height = strings[3];
        cha_data.width = str_width.toInt();
        cha_data.height = str_height.toInt();

        QString str_numOfStroke = strings[1];
        cha_data.number_of_stroke = str_numOfStroke.toInt();

        for (int i = 4; i < strings.size(); i++)
        {
            QString str_value = strings[i];
            cha_data.area_data[i-4] = str_value.toInt();
        }

        // Add 1 set of data to Character Set
        list_characters.append(cha_data);
    }
    reader.flush();
    reader.close();
}

QString CWD_CharacterDetection::detectCharacters(QString str_input)
{
    int32_t input[9];
    int32_t numberOfStroke = 0;
    QString result = "";

    // Convert input from string to array integer
    QStringList strings = str_input.split(",");

    numberOfStroke = ((QString)(strings[0])).toInt();

    input[0] = ((QString)(strings[1])).toInt();
    input[1] = ((QString)(strings[2])).toInt();
    input[2] = ((QString)(strings[3])).toInt();
    input[3] = ((QString)(strings[4])).toInt();
    input[4] = ((QString)(strings[5])).toInt();
    input[5] = ((QString)(strings[6])).toInt();
    input[6] = ((QString)(strings[7])).toInt();
    input[7] = ((QString)(strings[8])).toInt();
    input[8] = ((QString)(strings[9])).toInt();

    result = "";
    // Loop all of Character Set
    for(int index = 0; index < list_characters.size(); index++)
    {
        CharacterSet dataSet = list_characters.at(index);

        if (numberOfStroke == dataSet.number_of_stroke)
        {
            result += dataSet.character;
            result += ",";
        }
    }

    result = result.remove(result.size() - 1, 1);
    return result;
}
