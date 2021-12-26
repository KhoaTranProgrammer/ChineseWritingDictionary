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
 * Oct-02-2021: Initial version                                               *
 *              - Define Model and delegate for searching result              *
 * [1.0.1]                                                                    *
 * Dec-10-2021: Support Audio For Pinyin                                      *
 *              - Refine Pinyin when display text only                        *
 * [1.0.2]                                                                    *
 * Dec-26-2021: Support Android Display                                       *
 *              - Update QML Text font pointSize to static                    *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root
    property int itemHeight: parent.height / 5

    property string p_hanzi
    property string p_trad
    property string p_pinyin
    property string p_vietMeaning
    property string p_engMeaning

    signal itemClicked

    // The definition of displaying of searching result
    Component {
        id: id_displayPlugins

        Item {
            width: parent.width
            height: itemHeight

            Rectangle {

                anchors {
                    fill: parent
                    margins: height * 0.01
                }
                color: "#FFFDE7"
                radius: height * 0.1
                border {
                    width: height * 0.01
                    color: "#448AFF"
                }

                Rectangle {
                    id: id_hanziArea
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: parent.top
                    }
                    height: parent.height * 0.23
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: chinese_data
                        font.family: "Helvetica"
                        font.pointSize: 20
                        font.bold: parent.height
                    }
                }

                Rectangle {
                    id: id_tradArea
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: id_hanziArea.bottom
                    }
                    height: parent.height * 0.23
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: traditional_data
                        font.family: "Helvetica"
                        font.pointSize: 20
                        font.bold: parent.height
                    }
                }

                Rectangle {
                    id: id_pinyinArea
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: id_tradArea.bottom
                    }
                    height: parent.height * 0.18
                    color: "transparent"

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: height * 0.2
                        }
                        text: myPyRe.convert(pinyin_data)
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                Rectangle {
                    id: id_vietArea
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: id_pinyinArea.bottom
                    }
                    height: parent.height * 0.18
                    color: "transparent"

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: height * 0.2
                        }
                        text: viet_data
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                Rectangle {
                    id: id_engArea
                    anchors {
                        left: parent.left
                        right: parent.right
                        top: id_vietArea.bottom
                    }
                    height: parent.height * 0.18
                    color: "transparent"

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: height * 0.2
                        }
                        text: eng_data
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                // Catch up Mouse click and get 1 record result
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        id_root.p_hanzi = chinese_data
                        id_root.p_trad = traditional_data
                        id_root.p_pinyin = pinyin_data
                        id_root.p_vietMeaning = viet_data
                        id_root.p_engMeaning = eng_data
                        id_root.itemClicked()
                    }
                }
            }
        }
    }

    // Model and delegate will be combined inside Flickable
    Flickable {
        id: id_listView
        anchors.fill: parent
        clip: true

        Column {
            anchors.fill: parent
            Repeater {
                id: id_repeater
            }
        }
    }

    // Init Search Result display with inputModel
    function initDisplay(inputModel) {
        id_repeater.model = inputModel
        id_repeater.delegate = id_displayPlugins
        id_listView.contentHeight = inputModel.count * itemHeight
    }

    // Recalculate the height of ListView base on number of model items
    function calContentHeight() {
        id_listView.contentHeight = id_repeater.model.count * itemHeight
    }
}
