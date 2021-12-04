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
 *              - Define ENGLISH_TYPE                                         *
 * [1.0.2]                                                                    *
 * Dec-03-2021: Support searching by Hanzi                                    *
 *              - Declare HANZI_TYPE                                          *
 * [1.0.3]                                                                    *
 * Dec-03-2021: Support searching by Pinyin                                   *
 *              - Declare PINYIN_TYPE                                         *
 * [1.0.4]                                                                    *
 * Dec-04-2021: Support searching by Vietnamese                               *
 *              - Declare VIETNAMESE_TYPE                                     *
 *****************************************************************************/

#include "CWD_GlobalVariableClass.h"

QString CWD_GlobalVariableClass::COL_CHINESE = "chinesemeaning";
QString CWD_GlobalVariableClass::COL_CHINESE_TRA = "chinesetraditionalmeaning";
QString CWD_GlobalVariableClass::COL_PINYIN = "pinyin";
QString CWD_GlobalVariableClass::COL_ENGMEAN = "englishmeaning";
QString CWD_GlobalVariableClass::COL_VIEMEAN = "vietmeaning";
QString CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE = "CWD_FTSdictionary";

QString CWD_GlobalVariableClass::ENGLISH_TYPE = "English";
QString CWD_GlobalVariableClass::HANZI_TYPE = "Chinese";
QString CWD_GlobalVariableClass::PINYIN_TYPE = "Pinyin";
QString CWD_GlobalVariableClass::VIETNAMESE_TYPE = "Vietnamese";
