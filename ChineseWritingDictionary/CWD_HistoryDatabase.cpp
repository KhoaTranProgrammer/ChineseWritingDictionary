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
 * This file implements for header of History processing                      *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-01-2021: Initial version                                               *
 *              - Support addWordToHistory/readHistory/deleteHistory          *
 *****************************************************************************/

#include "CWD_HistoryDatabase.h"

CWD_HistoryDatabase::CWD_HistoryDatabase()
{

}

void CWD_HistoryDatabase::addWordToHistory(QString simplifyChi, QString traditionalChi, QString definition, QString engdef, QString vietdef)
{
    QFile file("history_data.txt");

    if (!file.open(QIODevice::ReadWrite)) {
        return;
    }

    QTextStream out(&file);
    QString cur_line;

    // Read all lines
    out.readAll();

    out << traditionalChi << "\t"
        << simplifyChi << "\t"
        << definition << "\t"
        << engdef << "\t"
        << vietdef
        << endl;

    file.close();
}

QString CWD_HistoryDatabase::readHistory()
{
    QFile file("history_data.txt");
    QString result = "";

    if (!file.open(QIODevice::ReadOnly)) {
        return result;
    } else {
        QTextStream in(&file);
        result = in.readAll();

        file.close();
    }
    return result;
}

void CWD_HistoryDatabase::deleteHistory()
{
    QFile file("history_data.txt");
    file.remove();
}
