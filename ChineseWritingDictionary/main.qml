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
 * [1.0.5]                                                                    *
 * Nov-21-2021: Fix Sql Connection Issue                                      *
 *              - Add Timer to process searching after complete type for 1s   *
 * [1.0.6]                                                                    *
 * Nov-28-2021: Support Information                                           *
 *              - Information Area with CWD_Information                       *
 *              - Search Result Area set on top of Information Area           *
 * [1.0.7]                                                                    *
 * Dec-01-2021: Support History                                               *
 *              - Add CWD_HistoryDatabase QML object                          *
 *              - Add word to history when user clicks search result          *
 * [1.0.8]                                                                    *
 * Dec-02-2021: Support Brush Hanzi Character                                 *
 *              - Add Area to support option functions                        *
 *              - Area to support brush hanzi character                       *
 * [1.0.9]                                                                    *
 * Dec-03-2021: Fix History Issue                                             *
 *              - Change from addWord to addWordToHistory                     *
 * [1.0.10]                                                                   *
 * Dec-04-2021: Support Refine Pinyin                                         *
 *              - Call convert method in function addOneRecord                *
 * [1.0.11]                                                                   *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Apply qsTr function                                         *
 *              - Declare text internally                                     *
 *              - Add ComboBox QML to select languages                        *
 * [1.0.12]                                                                   *
 * Dec-10-2021: Support Audio For Pinyin                                      *
 *              - Do not Refine Pinyin in main.qml                            *
 * [1.0.13]                                                                   *
 * Dec-26-2021: Support Android Display                                       *
 *              - Update QML Text font pointSize to static                    *
 * [1.0.14]                                                                   *
 * Dec-26-2021: Fix Index Of Language Type                                    *
 *              - VIE: 1 - ENG: 0                                             *
 * [1.0.15]                                                                   *
 * Dec-29-2021: Update Information GUI                                        *
 *              - Change location of Information GUI from bottom to left      *
 *****************************************************************************/

import QtQuick 2.9
import QtQuick.Controls 1.4
import CWD_HistoryDatabase 1.0
import CWD_LanguageType 1.0

Rectangle {
    id: id_root
    anchors.fill: parent
    color: "black"

    // Variable to hold search type
    property string searchType
    property string currentSearchString: ""

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

            text: qsTr("Chinese Writing Dictionary") + mytrans.emptyString
            font.family: "Helvetica"
            font.pointSize: 20
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
                font.pointSize: 15
                placeholderText: qsTr(id_searchTypeArea.p_textFieldGuide) + mytrans.emptyString

                onTextChanged: {
                    if( id_searchingTimer.running == false)
                        id_searchingTimer.start()
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

                text: qsTr("Search by") + mytrans.emptyString
                font.family: "Helvetica"
                font.pointSize: 15
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
                id_root.searchType = p_curType
            }

            Component.onCompleted: {
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
                scene.p_pinyinRefine = myPyRe.convert(id_searchResult.p_pinyin)
                scene.p_engMeaning = id_searchResult.p_engMeaning
                scene.p_vietMeaning = id_searchResult.p_vietMeaning
                scene.close.connect(closeLoader)
                scene.initDetail()
                id_searchResultArea.enabled = false

                // Add word to history
                id_historyDb.addWordToHistory(   id_searchResult.p_hanzi,
                                                 id_searchResult.p_trad,
                                                 id_searchResult.p_pinyin,
                                                 id_searchResult.p_engMeaning,
                                                 id_searchResult.p_vietMeaning
                                             )
            }
        }
    }

    // Information Area
    Rectangle {
        id: id_informationArea
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        width: id_root.width * 0.1
        height: id_root.height * 0.3
        color: "transparent"

        CWD_Information {
            id: id_information
            anchors.fill: parent

            onSelected: {
                id_loader.source = p_qmlFile
                var scene = null
                scene = id_loader.item
                scene.parent = id_root
                scene.anchors.fill = id_root
                scene.close.connect(closeLoader)
                id_searchResultArea.enabled = false
            }
        }
    }

    // Add CWD_HistoryDatabase QML object
    CWD_HistoryDatabase {
        id: id_historyDb
    }
    
    // Area to support option functions
    Rectangle {
        id: id_optionarea
        anchors {
            right: id_root.right
            verticalCenter: id_root.verticalCenter
        }
        width: id_root.width * 0.1
        height: width
        color: "transparent"

        // Brush Button
        Rectangle {
            id: id_brush

            property bool isSelected: false

            anchors.fill: parent
            color: "transparent"

            // Image for button
            Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: 'res/img/ic_brush.png'
            }

            // When user clicks
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (id_brush.isSelected === true) {
                        id_brush.color = "transparent"
                        id_brush.isSelected = false
                        id_brusharea.enabled = false
                        id_brusharea.visible = false
                    } else {
                        id_brush.color = "white"
                        id_brush.isSelected = true
                        id_brusharea.enabled = true
                        id_brusharea.visible = true
                    }
                }
            }
        }
    }

    // Area to support brush hanzi character
    Rectangle {
        id: id_brusharea
        property bool isReset: false
        anchors {
            bottom: parent.bottom
            horizontalCenter: id_root.horizontalCenter
        }
        width: id_root.width * 0.6
        height: width
        color: "transparent"
        visible: false

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: parent.width * 0.1
            color: "black"

            CWD_BrushResultList {
                id: id_brushResLst
                anchors.fill: parent

                onSelected: {
                    id_textFieldSearch.text += id_brushResLst.p_curChar
                }
            }
        }

        Rectangle {
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            height: parent.width * 0.1
            color: "transparent"

            Text {
                anchors.centerIn: parent

                text: qsTr("Clear") + mytrans.emptyString
                font.family: "Helvetica"
                font.pointSize: 20
                color: "white"

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        id_brusharea.isReset = true
                        mycanvas.requestPaint()
                        id_brushResLst.clearList()
                    }
                }
            }

        }

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: width

            Canvas {
                id: mycanvas
                property int prevX
                property int prevY
                property color drawColor: "black"
                property int numberOfStroke: 0
                property bool isReleased: false
                anchors {
                    left: parent.left
                    top: parent.top
                }
                width: Math.floor(parent.width)
                height: Math.floor(parent.height)

                MouseArea {
                    id:mousearea
                    anchors.fill: parent
                    onPressed: {
                        mycanvas.prevX = mouseX
                        mycanvas.prevY = mouseY
                        mycanvas.isReleased = false
                    }
                    onReleased: {
                        mycanvas.isReleased = true
                        mycanvas.requestPaint()
                    }
                    onPositionChanged: {
                        mycanvas.requestPaint()
                    }

                }

                onPaint: {
                    if (id_brusharea.isReset == true) {
                        mycanvas.numberOfStroke = 0
                        id_brusharea.isReset = false
                        var ctx = getContext("2d");
                        ctx.reset();
                    }
                    else {
                        var ctx = getContext('2d')
                        ctx.beginPath()
                        ctx.strokeStyle = drawColor
                        ctx.lineWidth = mycanvas.height * 0.025
                        ctx.moveTo(mycanvas.prevX, mycanvas.prevY)
                        ctx.lineTo(mousearea.mouseX, mousearea.mouseY)
                        ctx.stroke()
                        ctx.closePath()
                        mycanvas.prevX = mousearea.mouseX
                        mycanvas.prevY = mousearea.mouseY

                        if (mycanvas.isReleased == true) {
                            mycanvas.numberOfStroke++
                            console.log("Count stroke: " + mycanvas.numberOfStroke)

                            var white_pixels = 0
                            var left = -1
                            var top = -1
                            var right = -1
                            var bottom = -1

                            var ar = ctx.getImageData(0, 0, width, height);
                            var line_data
                            for( var rw=0; rw < height; rw++ ) {
                                line_data = ""
                                for( var cl=0; cl < width; cl++ ) {
                                    if (cl != 0) line_data += "\t"
                                    if((ar.data[rw * width * 4 + cl * 4 + 0] !== 0) ||
                                       (ar.data[rw * width * 4 + cl * 4 + 1] !== 0) ||
                                       (ar.data[rw * width * 4 + cl * 4 + 2] !== 0) ||
                                       (ar.data[rw * width * 4 + cl * 4 + 3] !== 0)
                                       ) {
                                        line_data += "255"
                                        white_pixels++
                                        if((left == -1) || (left > cl)) left = cl
                                        if((right == -1) || (right < cl)) right = cl
                                        if((top == -1) || (top > rw)) top = rw
                                        if((bottom == -1) || (bottom < rw)) bottom = rw
                                    }
                                    else
                                    {
                                        line_data += "0";
                                    }
                                }
                            }
                            if (white_pixels == 0) white_pixels = 1

                            var block_cols = 3
                            var block_rows = 3
                            var block_index = 0
                            var sum_data = 0
                            var feature_str = ""
                            for (var i = 0; i < block_rows; i++) {
                                for (var j = 0; j < block_cols; j++) {
                                    var start_rows = top + i * Math.ceil((bottom - top) / block_rows)
                                    var stop_rows = top + (i + 1) * Math.ceil((bottom - top) / block_rows)
                                    var start_cols = left + j * Math.ceil((right - left) / block_cols)
                                    var stop_cols = left + (j + 1) * Math.ceil((right - left) / block_cols)
                                    var block_white = 0

                                    for (var l = start_rows; l < stop_rows; l++) {
                                        for (var m = start_cols; m < stop_cols; m++) {
                                            if((ar.data[l * width * 4 + m * 4 + 0] !== 0) ||
                                               (ar.data[l * width * 4 + m * 4 + 1] !== 0) ||
                                               (ar.data[l * width * 4 + m * 4 + 2] !== 0) ||
                                               (ar.data[l * width * 4 + m * 4 + 3] !== 0)
                                                )
                                                block_white++
                                        }
                                    }
                                    var block_white_per = Math.floor(block_white * 100 / white_pixels)
                                    if (feature_str === "") {
                                        feature_str = block_white_per.toString()
                                    }
                                    else {
                                        feature_str += ","
                                        feature_str += block_white_per.toString()
                                    }
                                    sum_data += block_white
                                }
                            }

                            // Detect characters
                            var resultChar = myChaDet.detectCharacters(mycanvas.numberOfStroke + "," + feature_str)

                            // Put data in GUI
                            id_brushResLst.clearList()
                            var separatelist = resultChar.split(",")
                            for (var idx = 0; idx < separatelist.length; idx++) {
                                id_brushResLst.addItem(separatelist[idx])
                            }
                        }
                    }
                }
            }
        }
    }

    ComboBox {
        anchors {
            right: parent.right
            top: id_headerArea.top
        }
        width: parent.width * 0.2

        textRole: "text"

        model: [
            { text: qsTr("English"), value: "ENG" },
            { text: qsTr("VietNam"), value: "VIE" }
        ]

        // When an item is selected, update the backend.
        onActivated: {
            if (currentIndex == 1) {
                mytrans.updateLanguage(CWD_LanguageType.VIE)
            } else {
                mytrans.updateLanguage(CWD_LanguageType.ENG)
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

    Timer {
        id: id_searchingTimer
        interval: 1000; running: false; repeat: true
        onTriggered: {
            if (id_root.currentSearchString === id_textFieldSearch.text) {
                // Start searching
                id_searchingTimer.stop()
                myDataBase.getWordMatches(id_textFieldSearch.text, id_root.searchType)
            } else {
                id_root.currentSearchString = id_textFieldSearch.text
            }
        }
    }
}
