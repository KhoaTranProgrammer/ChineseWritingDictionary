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
 * This file contains global data used by C++ layer                           *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Define the name of database and column name                 *
 * [1.0.1]                                                                    *
 * Oct-02-2021: Support searching by English                                  *
 *              - Declare ENGLISH_TYPE                                        *
 * [1.0.2]                                                                    *
 * Dec-03-2021: Support searching by Hanzi                                    *
 *              - Declara HANZI_TYPE                                          *
 *****************************************************************************/

#ifndef CWD_GLOBALVARIABLECLASS_H
#define CWD_GLOBALVARIABLECLASS_H

#include <QString>

class CWD_GlobalVariableClass
{
public:
    // Uses for database procesing, indicates the name of columns
    static QString COL_CHINESE;
    static QString COL_CHINESE_TRA;
    static QString COL_PINYIN;
    static QString COL_ENGMEAN;
    static QString COL_VIEMEAN;
    static QString COL_TIMESTAMP;
    static QString FTS_VIRTUAL_TABLE;

    // Search types
    static QString ENGLISH_TYPE;
    static QString HANZI_TYPE;
};

#endif // CWD_GLOBALVARIABLECLASS_H
