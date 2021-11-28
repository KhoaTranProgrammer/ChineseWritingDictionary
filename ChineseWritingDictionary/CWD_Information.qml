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
 * This file implements the control for user to select the type of Information*
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Nov-27-2021: Initial version                                               *
 *              - Define Model and delegate for information types             *
 *              - Load information types from String_GUI.js                   *
 *              - Support Radical                                             *
 *****************************************************************************/

import QtQuick 2.0
import "res/str/String_GUI.js" as String_GUI

Item {
    id: id_root

    property string p_qmlFile: ""

    signal selected

    // Load Information types when Component is in Completed state
    Component.onCompleted: {
        id_listOfInformation.append({"img": String_GUI.information_types[0], "qmlFile": String_GUI.information_types[1]})
    }

    // Background is set as transparent
    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    // Contains the list of searching type
    ListModel {
        id: id_listOfInformation
    }

    // The definition of displaying of information type
    Component {
        id: id_displayDelegate

        Item {
            id: id_delegateItem

            height: id_root.height
            width: id_root.width / id_listOfInformation.count

            Rectangle {
                id: id_bg
                anchors.fill: parent
                color: "white"
                border.width: id_bg.height * 0.05
                border.color: "#B3E5FC"

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "res/img/" + img
                }

                // Catch up Mouse click and perform processing
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        id_root.p_qmlFile = qmlFile
                        id_root.selected()
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
                model: id_listOfInformation
                delegate: id_displayDelegate
            }
        }
    }
}
