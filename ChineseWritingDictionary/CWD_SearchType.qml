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
 * This file implements the control for user to select the type of searching  *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Define Model and delegate for searching types               *
 *              - Load searching types from String_GUI.js                     *
 *****************************************************************************/

import QtQuick 2.0
import "res/str/String_GUI.js" as String_GUI

Item {
    id: id_root

    property string p_curType: String_GUI.search_types[0]
    property string p_textFieldGuide: String_GUI.search_types[1]
    signal selected

    // Load searching types when Component is in Completed state
    Component.onCompleted: {
        id_listOfType.append({"type": String_GUI.search_types[0], "textFieldGuide": String_GUI.search_types[1]})
        id_listOfType.append({"type": String_GUI.search_types[2], "textFieldGuide": String_GUI.search_types[3]})
        id_listOfType.append({"type": String_GUI.search_types[4], "textFieldGuide": String_GUI.search_types[5]})
        id_listOfType.append({"type": String_GUI.search_types[6], "textFieldGuide": String_GUI.search_types[7]})
    }

    // Background is set as transparent
    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    // Contains the list of searching type
    ListModel {
        id: id_listOfType
    }

    // The definition of displaying of searching type
    Component {
        id: id_displayDelegate

        Item {
            id: id_delegateItem

            height: id_root.height
            width: id_root.width / id_listOfType.count

            Rectangle {
                id: id_bg
                anchors.fill: parent
                color: "transparent"
                radius: 10

                property string p_curType: id_root.p_curType

                Text {
                    anchors.centerIn: parent

                    text: qsTr(type)
                    font.family: "Helvetica"
                    font.pointSize: parent.height * 0.35
                    color: "white"
                }

                Component.onCompleted: {
                    if (type == p_curType) id_bg.color = "#B3E5FC"
                }

                // Catch up Mouse click and perform processing
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (type != id_bg.p_curType) {
                            id_root.p_curType = type
                            id_root.p_textFieldGuide = textFieldGuide
                            id_root.selected()
                        }
                    }
                }

                onP_curTypeChanged: {
                    if(type == id_bg.p_curType) {
                        id_bg.color = "#B3E5FC"
                    } else {
                        id_bg.color = "transparent"
                    }
                }
            }
        }
    }

    // Model and delegate will be combined inside Flickable
    Flickable {
        id: id_container

        anchors {
            top: id_root.top
            bottom: id_root.bottom
            left: id_root.left
        }
        width: parent.width
        contentWidth: parent.width
        clip: false

        Row {
            anchors.fill: parent
            Repeater {
                model: id_listOfType
                delegate: id_displayDelegate
            }
        }
    }
}
