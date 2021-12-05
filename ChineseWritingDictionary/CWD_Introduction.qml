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
 * This file implements the control for user to view Radical information      *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Nov-28-2021: Initial version                                               *
 *              - Define Layout to display text introduction                  *
 *              - Load information types from String_GUI.js                   *
 * [1.0.1]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Apply qsTr function                                         *
 *              - Declare text internally                                     *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root

    signal close()

    Rectangle {
        anchors.fill: parent
        color: "#B3E5FC"
    }

    // Header area
    Rectangle {
        id: id_headerArea
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height * 0.05
        color: "transparent"

        Rectangle {
            id: id_backButton

            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: height
            color: "transparent"

            Image {
                anchors.fill: parent
                source: "res/img/ic_arrow_back.png"
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    id_root.close()
                }
            }
        }
    }

    // Display Area
    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: id_headerArea.bottom
            bottom: parent.bottom
        }
        color: "transparent"

        Text {
            anchors.fill: parent
            text: qsTr(
                      "How to write Chinese words are the most difficult, and also are the most interesting of studying Chinese language.\nFor this purpose, \'Chinese Writing Dictionary\' application is created to introduce how to write Chinese words." +
                      "\nThis is free software, refers the database from website: https://www.mdbg.net/chindict/chindict.php?page=cedict and revise to add Vietnamese meaning." +
                      "\nSupports to look up by 4 methods: Chinese, Pinyin, English, Vietnamese." +
                      "\nGuides to write for more than 5000 Chinese characters." +
                      "\n\nIf you have any comment/concern, please contact us via: tudienchuviettienghoa@gmail.com")
            font.family: "Helvetica"
            font.pointSize: parent.height * 0.02
            wrapMode: Text.Wrap
        }
    }
}
