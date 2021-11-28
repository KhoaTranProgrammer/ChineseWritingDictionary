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
 *              - Define Model and delegate for Radical ListElement           *
 *              - Load information types from String_GUI.js                   *
 *****************************************************************************/

import QtQuick 2.0
import "res/str/String_GUI.js" as String_GUI

Item {
    id: id_root
    property int itemHeight: parent.height / 15

    signal close()

    // Load searching types when Component is in Completed state
    Component.onCompleted: {
        for( var i = 0; i < String_GUI.radicals_list.length; i++) {
            id_listOfRadical.append({   "index": i+1,
                                        "radicalChar": String_GUI.radicals_list[i],
                                        "stroke": String_GUI.radicals_stroke[i],
                                        "pinyin": String_GUI.radicals_pinyin[i],
                                        "meaning": String_GUI.radicals_english[i]})
        }
    }

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

    // Contains the list of radical character
    ListModel {
        id: id_listOfRadical
    }

    // The definition of displaying of radical information
    Component {
        id: id_displayRadical

        Item {
            width: parent.width
            height: itemHeight

            Rectangle {

                anchors {
                    fill: parent
                }
                color: "transparent"
                radius: height * 0.1
                border {
                    width: height * 0.01
                    color: "black"
                }

                Rectangle {
                    id: id_index
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.1
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: index
                        font.family: "Helvetica"
                        font.pointSize: parent.height * 0.3
                    }
                }

                Rectangle {
                    id: id_radical
                    anchors {
                        left: id_index.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.23
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: radicalChar
                        font.family: "Helvetica"
                        font.pointSize: parent.height * 0.4
                        font.bold: parent.height
                    }
                }

                Rectangle {
                    id: id_stroke
                    anchors {
                        left: id_radical.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.1
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: stroke
                        font.family: "Helvetica"
                        font.pointSize: parent.height * 0.3
                    }
                }

                Rectangle {
                    id: id_pinyin
                    anchors {
                        left: id_stroke.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.25
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: pinyin
                        font.family: "Helvetica"
                        font.pointSize: parent.height * 0.3
                    }
                }

                Rectangle {
                    id: id_meaning
                    anchors {
                        left: id_pinyin.right
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: qsTr(meaning)
                        font.family: "Helvetica"
                        font.pointSize: parent.height * 0.3
                    }
                }
            }
        }
    }

    // Model and delegate will be combined inside Flickable
    Flickable {
        id: id_listView
        anchors {
            left: parent.left
            right: parent.right
            top: id_headerArea.bottom
            bottom: parent.bottom
        }
        contentHeight: id_listOfRadical.count * itemHeight
        clip: true

        Column {
            anchors.fill: parent
            Repeater {
                model: id_listOfRadical
                delegate: id_displayRadical
            }
        }
    }
}
