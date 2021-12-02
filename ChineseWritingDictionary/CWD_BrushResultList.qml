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
 * This file implements the control list of Hanzi character from Brush        *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-02-2021: Initial version                                               *
 *              - Define Model and delegate                                   *
 *              - Function addItem/clearList                                  *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root
    property int itemHeight: parent.height
    property string p_curChar

    signal selected

    ListModel {
        id: id_characterList
    }

    Component {
        id: id_component

        Item {
            width: id_root.itemHeight
            height: id_root.itemHeight

            Rectangle {
                id: id_roundBg
                anchors.fill: parent
                color: "transparent"

                property string p_curChar: id_root.p_curChar

                Text {
                    anchors.centerIn: parent
                    color: "white"

                    text: character
                    font.family: "Helvetica"
                    font.pointSize: parent.height * 0.5
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        id_root.p_curChar = character
                        id_root.selected()
                    }
                }

            }
        }
    }

    Flickable {
        id: id_listView
        anchors.fill: id_root
        contentHeight: id_root.height
        clip: true

        Row {
            id: layout
            anchors.fill: parent
            Repeater {
                model: id_characterList
                delegate: id_component
            }
        }
    }

    function addItem(character) {
        id_characterList.append({"character": character})
        id_listView.contentWidth = id_characterList.count * id_root.itemHeight
    }

    function clearList() {
        id_characterList.clear()
    }
}
