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
 * [1.0.1]                                                                    *
 * Sep-26-2021: Support searching                                             *
 *              - Add GUI supporting user to select the type of search        *
 * [1.0.2]                                                                    *
 * Oct-02-2021: Support display Search Result                                 *
 *              - Add GUI CWD_SearchResult                                    *
 *              - Store the list of search result, clear search data          *
 *              - Function to add 1 record to ListView                        *
 * [1.0.3]                                                                    *
 * Oct-02-2021: Load Detail screen                                            *
 *              - Process onItemClicked inside CWD_SearchResult               *
 *              - Using Loader to load CWD_Detail.qml                         *
 *              - Loader to load Detail screen                                *
 *              - Function to close Detail screen                             *
 * [1.0.4]                                                                    *
 * Oct-04-2021: Support Drawing Strokes Of Character                          *
 *              - Call initDetail of CWD_Detail.qml                           *
 *****************************************************************************/

import QtQuick 2.9
import QtQuick.Controls 1.4
import "res/str/String_GUI.js" as String_GUI

Rectangle {
    id: id_root
    anchors.fill: parent
    color: "black"

    // Variable to hold search type
    property string searchType

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
                    myDataBase.getWordMatches(id_textFieldSearch.text, id_root.searchType)
                }
            }
        }

        Rectangle {
            id: id_searchBy
            anchors {
                left: parent.left
                top: id_searchIcon.bottom
                bottom: parent.bottom
            }
            width: parent.width * 0.2
            color: "transparent"

            Text {
                anchors.centerIn: parent

                text: qsTr(String_GUI.search_title)
                font.family: "Helvetica"
                font.pointSize: parent.height * 0.4
                color: "white"
            }
        }

        CWD_SearchType {
            id: id_searchTypeArea

            anchors {
                bottom: parent.bottom
                left: id_searchBy.right
                right: parent.right
                top: id_searchIcon.bottom
            }

            onSelected: {
                id_textFieldSearch.placeholderText = p_textFieldGuide
                id_root.searchType = p_curType
            }

            Component.onCompleted: {
                id_textFieldSearch.placeholderText = p_textFieldGuide
                id_root.searchType = p_curType
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
                id_searchResultArea.enabled = false
            }
        }
    }

    // Store the list of search result
    ListModel {
        id: id_listPlugins
    }

    // Clear search data
    function clearData() {
        id_listPlugins.clear()
    }

    // Function to add 1 record to ListView
    function addOneRecord(chinese_data, traditional_data, pinyin_data, viet_data, eng_data) {
        id_listPlugins.append({"chinese_data": chinese_data,
                               "traditional_data": traditional_data,
                               "pinyin_data": pinyin_data,
                               "viet_data": viet_data,
                               "eng_data": eng_data
                              })

        // Recalculate ContentHeight
        id_searchResult.calContentHeight()
    }

    // Loader to load Detail screen
    Loader {
        id: id_loader
    }

    // Function to close Detail screen
    function closeLoader() {
        id_loader.source = ""
        id_searchResultArea.enabled = true
    }
}
