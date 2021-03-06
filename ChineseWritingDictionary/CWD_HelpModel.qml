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
 * This file implements the control for user to view Help information         *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-03-2021: Initial version                                               *
 *              - Define list of elements for searching                       *
 * [1.0.1]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Apply qsTr function                                         *
 *              - Declare text internally                                     *
 *****************************************************************************/

import QtQuick 2.0

ListModel {

    ListElement {
        title: qsTr("How to search by Chinese?")
        picture: "res/img/ic_help.png"
        method: qsTr("To search by Chinese, please select Search by Chinese mode\nType Chinese characters or draw character by using Brush button")
    }

    ListElement {
        title: qsTr("How to search by Pinyin?")
        picture: "res/img/ic_help.png"
        method: qsTr("To search by Pinyin, please select Search by Pinyin mode\nThe method to input Pinyin\nInitial + Final + Tone\nExample:\nTo look up 'b??': type 'ba1'\nTo look up 'b??': type 'ba2'\nTo look up 'b??': type 'ba3'\nTo look up 'b??': type 'ba4'\nTo look up 'le': type 'le5'\nTo look up 'n??': type 'nu:3'")
    }

    ListElement {
        title: qsTr("How to search by English?")
        picture: "res/img/ic_help.png"
        method: qsTr("To search by English, please select Search by English mode")
    }

    ListElement {
        title: qsTr("How to search by Vietnamese?")
        picture: "res/img/ic_help.png"
        method: qsTr("To search by Vietnamese, please select Search by Vietnamese mode\nTo look up more accuracy, please input Vietnamese exactly\nExample: Input \'b??ng ????\' instead of \'bong da\'")
    }
}
