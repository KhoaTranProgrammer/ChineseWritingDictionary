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
 * This file is the main screen of Chinese Writing Dictionary                 *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-25-2021: Initial version                                               *
 *              - Create layout of Header area, Search box area,              *
 *                Search Result Area                                          *
 *              - Set Application title in Header area                        *
 *              - Implement TextField to input string in Search box area      *
 *****************************************************************************/

import QtQuick 2.9
import QtQuick.Controls 1.4
import "res/str/String_GUI.js" as String_GUI

Rectangle {
    id: id_root
    anchors.fill: parent
    color: "black"

    // Header area
    Rectangle {
        id: id_headerArea
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height * 0.05
        color: "#448AFF"

        Text {
            anchors {
                verticalCenter: parent.verticalCenter
            }

            text: qsTr(String_GUI.app_title)
            font.family: "Helvetica"
            font.pointSize: parent.height / 2
            color: "white"
        }
    }

    // Search box area
    Rectangle {
        id: id_searchBoxArea
        anchors {
            left: parent.left
            right: parent.right
            top: id_headerArea.bottom
        }
        height: parent.height * 0.1
        color: "#448AFF"

        Rectangle {
            id: id_searchIcon
            anchors {
                left: parent.left
                top: parent.top
            }
            height: parent.height * 0.5
            width: height
            color: "transparent"

            Image {
                anchors.fill: parent
                source: "res/img/ic_search.png"
            }
        }

        Rectangle {
            id: id_searchText
            anchors {
                top: parent.top
                right: parent.right
                left: id_searchIcon.right
            }
            height: parent.height * 0.5
            color: "transparent"

            TextField {
                id: id_textFieldSearch
                anchors.fill: parent
                font.family: "Helvetica"
                font.pointSize: parent.height / 2

                onTextChanged: {

                }
            }
        }
    }

    // Search Result Area
    Rectangle {
        id: id_searchResultArea
        anchors {
            left: parent.left
            right: parent.right
            top: id_searchBoxArea.bottom
            bottom: parent.bottom
        }
        color: "#B3E5FC"
    }
}
