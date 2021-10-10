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
 * This file implements the control for display strokes list                  *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Oct-04-2021: Initial version                                               *
 *              - Define Model and delegate for searching types               *
 *              - Support CWD_WritingImage                                    *
 *****************************************************************************/

import QtQuick 2.0
import CWD_WritingImage 1.0

Item {
    id: id_root
    property int itemHeight: parent.height

    ListModel {
        id: id_symbolList
    }

    Component {
        id: id_component

        Item {
            width: id_root.itemHeight
            height: id_root.itemHeight

            Rectangle {
                anchors.fill: parent
                color: "transparent"

                CWD_WritingImage {
                    id: id_displaySymbolImage
                    anchors {
                        centerIn: parent
                        fill: parent
                        margins: parent.height * 0.05
                    }

                    image: myWriting.convertSymbolToQImage()
                }
            }
        }
    }

    Flickable {
        anchors.fill: id_root
        contentHeight: id_root.height
        contentWidth: id_root.height * id_symbolList.count

        Row {
            id: layout
            anchors.fill: parent
            Repeater {
                model: id_symbolList
                delegate: id_component
            }
        }
    }

    function addItem() {
        id_symbolList.append({"name": ""})
    }

    function clearList() {
        id_symbolList.clear()
    }
}
