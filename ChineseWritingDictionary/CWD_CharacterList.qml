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
 * This file implements the control for list of display characters            *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Oct-04-2021: Initial version                                               *
 *              - Define Model and delegate for list of display characters    *
 * [1.0.1]                                                                    *
 * Dec-26-2021: Support Android Display                                       *
 *              - Update QML Text font pointSize to static                    *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root
    property int itemHeight: parent.height
    property string p_curChar

    signal selected

    // Model
    ListModel {
        id: id_characterList
    }

    // Delegate
    Component {
        id: id_component

        Item {
            width: id_root.itemHeight
            height: id_root.itemHeight

            Rectangle {
                id: id_roundBg
                anchors.fill: parent
                radius: height / 2
                color: "#FFFDE7"

                property string p_curChar: id_root.p_curChar

                Text {
                    anchors.centerIn: parent
                    color: "black"

                    text: character
                    font.family: "Helvetica"
                    font.pointSize: 15
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (character != id_roundBg.p_curChar) {
                            id_root.p_curChar = character
                            id_root.selected()
                        }
                    }
                }

                onP_curCharChanged: {
                    if(character == id_roundBg.p_curChar) {
                        id_roundBg.color = "#448AFF"
                    } else {
                        id_roundBg.color = "#FFFDE7"
                    }
                }
            }
        }
    }

    // Model and delegate will be combined inside Flickable
    Flickable {
        anchors.fill: id_root
        contentHeight: id_root.height
        contentWidth: id_root.width

        Row {
            id: layout
            anchors.fill: parent
            Repeater {
                model: id_characterList
                delegate: id_component
            }
        }
    }

    // addItem function to add 1 character to Model
    function addItem(character) {
        id_characterList.append({"character": character})
    }
}
