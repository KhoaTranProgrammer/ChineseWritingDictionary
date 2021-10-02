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
 *              - Add Header area, signal close, Hanzi Area, Meaning Area     *
 *              - Display Hanzi, traditional, pinyin, english, vietnamese     *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root

    property string p_hanzi
    property string p_trad
    property string p_pinyin
    property string p_vietMeaning
    property string p_engMeaning

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
        color: "#448AFF"

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

        Text {
            anchors {
                verticalCenter: parent.verticalCenter
                left: id_backButton.right
            }

            text: "Detail"
            font.family: "Helvetica"
            font.pointSize: parent.height / 2
            color: "white"
        }
    }

    // Hanzi Area
    Rectangle {
        id: id_hanziArea

        anchors {
            top: id_headerArea.bottom
            left: parent.left
            right: parent.right
        }
        height: parent.height * 0.08
        color: "#FFFDE7"

        Text {
            anchors.centerIn: parent

            text: id_root.p_hanzi
            font.family: "Helvetica"
            font.pointSize: parent.height * 0.7
            color: "black"
        }
    }

    // Meaning Area
    Rectangle {
        id: id_meaningArea

        anchors {
            top: id_hanziArea.bottom
            left: parent.left
            right: parent.right
        }
        height: (parent.height - (id_hanziArea.height + id_headerArea.height)) * 0.5
        color: "#B3E5FC"

        Rectangle {
            id: id_trad

            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            height: parent.height * 0.15
            color: "#B3E5FC"

            Text {
                id: id_static_trad
                anchors {
                    left: parent.left
                    margins: parent.height * 0.1
                    verticalCenter: parent.verticalCenter
                }
                width: parent.width * 0.2
                color: "#448AFF"

                text: "Traditional:"
                font.family: "Helvetica"
                font.pointSize: parent.height * 0.3
            }

            Text {
                id: id_text_trad
                anchors {
                    left: id_static_trad.right
                    margins: parent.height * 0.1
                    verticalCenter: parent.verticalCenter
                }
                width: parent.width * 0.2
                color: "black"

                text: id_root.p_trad
                font.family: "Helvetica"
                font.pointSize: parent.height * 0.7
            }
        }

        Rectangle {
            id: id_pinyin

            anchors {
                left: parent.left
                right: parent.right
                top: id_trad.bottom
            }
            height: parent.height * 0.15
            color: "#B3E5FC"

            Text {
                id: id_static_pinyin
                anchors {
                    left: parent.left
                    margins: parent.height * 0.1
                    verticalCenter: parent.verticalCenter
                }
                width: parent.width * 0.15
                color: "#448AFF"

                text: "Pinyin:"
                font.family: "Helvetica"
                font.pointSize: parent.height * 0.3
            }

            Text {
                id: id_text_pinyin
                anchors {
                    left: id_static_pinyin.right
                    margins: parent.height * 0.1
                    verticalCenter: parent.verticalCenter
                }
                width: parent.width * 0.2
                color: "black"

                text: id_root.p_pinyin
                font.family: "Helvetica"
                font.pointSize: parent.height * 0.3
            }
        }

        Rectangle {
            id: id_vietnameseMeaning

            anchors {
                left: parent.left
                right: parent.right
                top: id_pinyin.bottom
            }
            height: parent.height * 0.3
            color: "#B3E5FC"

            Text {
                id: id_static_viet
                anchors {
                    left: parent.left
                    margins: id_pinyin.height * 0.1
                    right: parent.right
                }
                height: parent.height * 0.3
                color: "#448AFF"

                text: "Vietnamese Meaning:"
                font.family: "Helvetica"
                font.pointSize: id_static_pinyin.font.pointSize
            }

            Text {
                id: id_text_viet
                anchors {
                    left: parent.left
                    leftMargin: id_pinyin.height * 0.1
                    right: parent.right
                    top: id_static_viet.bottom
                }
                height: parent.height * 0.7
                color: "black"

                text: id_root.p_vietMeaning
                font.family: "Helvetica"
                font.pointSize: id_static_pinyin.font.pointSize * 0.7
                wrapMode: Text.Wrap
            }
        }

        Rectangle {
            id: id_englishMeaning

            anchors {
                left: parent.left
                right: parent.right
                top: id_vietnameseMeaning.bottom
            }
            height: parent.height * 0.3
            color: "#B3E5FC"

            Text {
                id: id_static_english
                anchors {
                    left: parent.left
                    margins: id_pinyin.height * 0.1
                    right: parent.right
                }
                height: parent.height * 0.3
                color: "#448AFF"

                text: "English Meaning:"
                font.family: "Helvetica"
                font.pointSize: id_static_pinyin.font.pointSize
            }

            Text {
                id: id_text_english
                anchors {
                    left: parent.left
                    leftMargin: id_pinyin.height * 0.1
                    right: parent.right
                    top: id_static_english.bottom
                }
                height: parent.height * 0.7
                color: "black"

                text: id_root.p_engMeaning
                font.family: "Helvetica"
                font.pointSize: id_static_pinyin.font.pointSize * 0.7
                wrapMode: Text.Wrap
            }
        }
    }
}