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
 * This file uses to define string using for GUI                              *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-25-2021: Initial version                                               *
 *              - Add app_title                                               *
 * [1.0.1]                                                                    *
 * Sep-26-2021: Support searching                                             *
 *              - Add search_title, search_types                              *
 * [1.0.2]                                                                    *
 * Oct-04-2021: Support detail                                                *
 *              - Add detail_title, detail_trad, detail_pinyin,               *
 *                detail_vietnamese, detail_english                           *
 * [1.0.2]                                                                    *
 * Oct-04-2021: Support For Stroke                                            *
 *              - Add detail_writing_title                                    *
 *****************************************************************************/

var app_title = "Chinese Writing Dictionary"

var search_title = "Search by"
var search_types = [
   "Chinese", "Type Chinese Word",
   "Pinyin", "Type Pinyin",
   "Vietnamese", "Type Vietnamese Word",
   "English", "Type English Word"
]

var detail_title = "Detail"
var detail_trad = "Traditional"
var detail_pinyin = "Pinyin"
var detail_vietnamese = "Vietnamese Meaning"
var detail_english = "English Meaning"
var detail_writing_title = "How to write?"
