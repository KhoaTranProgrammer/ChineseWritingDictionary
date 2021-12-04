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
 * This file implements the control for user to view History information      *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-01-2021: Initial version                                               *
 *              - Load History/Delete History/View Detail                     *
 *              - Use CWD_SearchResult to show up history                     *
 *              - Use CWD_Detail.qml to show the detail                       *
 * [1.0.1]                                                                    *
 * Dec-04-2021: Support Refine Pinyin                                         *
 *              - Call convert method while loading Historyord                *
 *****************************************************************************/

import QtQuick 2.0
import CWD_HistoryDatabase 1.0

Item {
    id: id_root

    property variant stringLines
    property variant stringList

    signal close()

    Component.onCompleted: {
        var result = id_historyDb.readHistory()
        stringLines = result.split('\n')
        for (var i = 0; i < stringLines.length; i++) {
            if (stringLines[i] !== "") {
                stringList = stringLines[i].split('\t')
                id_listPlugins.append({"chinese_data": stringList[1],
                                       "traditional_data": stringList[0],
                                       "pinyin_data": myPyRe.convert(stringList[2]),
                                       "viet_data": stringList[3],
                                       "eng_data": stringList[4]
                                      })
            }
        }
    }

    // Add CWD_HistoryDatabase QML object
    CWD_HistoryDatabase {
        id: id_historyDb
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

        Rectangle {
            id: id_deleteButton

            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            width: height
            color: "transparent"

            Image {
                anchors.fill: parent
                source: "res/img/ic_history_delete.png"
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    id_listPlugins.clear()
                    id_historyDb.deleteHistory()
                }
            }
        }
    }

    // Store the list of search result
    ListModel {
        id: id_listPlugins
    }

    // History Area
    Rectangle {
        id: id_historyArea
        anchors {
            left: parent.left
            right: parent.right
            top: id_headerArea.bottom
            bottom: parent.bottom
        }
        color: "#B3E5FC"

        CWD_SearchResult {
            id: id_searchResult
            anchors.fill: parent

            Component.onCompleted: {
                initDisplay(id_listPlugins)
            }

            onItemClicked: {
                id_loader.source = "CWD_Detail.qml"
                var scene = null
                scene = id_loader.item
                scene.parent = id_root
                scene.anchors.fill = id_root
                scene.p_hanzi = id_searchResult.p_hanzi
                scene.p_trad = id_searchResult.p_trad
                scene.p_pinyin = id_searchResult.p_pinyin
                scene.p_engMeaning = id_searchResult.p_engMeaning
                scene.p_vietMeaning = id_searchResult.p_vietMeaning
                scene.close.connect(closeLoader)
                scene.initDetail()
                id_historyArea.enabled = false
            }
        }
    }

    // Loader to load Detail screen
    Loader {
        id: id_loader
    }

    // Function to close Detail screen
    function closeLoader() {
        id_loader.source = ""
        id_historyArea.enabled = true
    }

}
