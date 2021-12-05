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
 * This file implements the control for user to view Help information         *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-03-2021: Initial version                                               *
 *              - Load History/Delete History/View Detail                     *
 * [1.0.1]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Apply qsTr function                                         *
 *              - Declare text internally                                     *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root

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
    }

    Component {
        id: recipeDelegate

        Item {
            id: recipe
            property real detailsOpacity : 0

            width: listView.width
            height: 70

            // A simple rounded rectangle for the background
            Rectangle {
                id: background
                x: 2; y: 2; width: parent.width - x*2; height: parent.height - y*2
                color: "ivory"
                border.color: "orange"
                radius: 5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: recipe.state = 'Details';
            }

            Row {
                id: topLayout
                x: 10; y: 10; height: recipeImage.height; width: parent.width
                spacing: 10

                Image {
                    id: recipeImage
                    width: 50; height: 50
                    source: picture
                }

                Column {
                    width: background.width - recipeImage.width - 20; height: recipeImage.height
                    spacing: 5

                    Text {
                        text: qsTr(title) + mytrans.emptyString
                        font.bold: true; font.pointSize: 16
                    }
                }
            }

            Item {
                id: details
                x: 10; width: parent.width - 20

                anchors { top: topLayout.bottom; topMargin: 10; bottom: parent.bottom; bottomMargin: 10 }
                opacity: recipe.detailsOpacity

                Flickable {
                    id: flick
                    width: parent.width
                    anchors { top: parent.top; bottom: parent.bottom }
                    contentHeight: methodText.height
                    clip: true

                    Text {
                        id: methodText
                        text: qsTr(method) + mytrans.emptyString
                        wrapMode: Text.WordWrap
                        width: details.width
                    }
                }

            }

            // A button to close the detailed view, i.e. set the state back to default ('').
            Rectangle {
                y: 10
                anchors { right: background.right; rightMargin: 10 }
                opacity: recipe.detailsOpacity
                width: recipe.width * 0.1
                height: width

                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: 'res/img/ic_cancel.png'
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: recipe.state = '';
                }
            }

            states: State {
                name: "Details"

                PropertyChanges { target: background; color: "white" }
                PropertyChanges { target: recipeImage; width: 130; height: 130 } // Make picture bigger
                PropertyChanges { target: recipe; detailsOpacity: 1; x: 0 } // Make details visible
                PropertyChanges { target: recipe; height: listView.height } // Fill the entire list area with the detailed view

                // Move the list so that this item is at the top.
                PropertyChanges { target: recipe.ListView.view; explicit: true; contentY: recipe.y }

                // Disallow flicking while we're in detailed view
                PropertyChanges { target: recipe.ListView.view; interactive: false }
            }

            transitions: Transition {
                // Make the state changes smooth
                ParallelAnimation {
                    ColorAnimation { property: "color"; duration: 500 }
                    NumberAnimation { duration: 300; properties: "detailsOpacity,x,contentY,height,width" }
                }
            }
        }
    }

    // The actual list
    ListView {
        id: listView
        anchors {
            top: id_headerArea.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        model: CWD_HelpModel {}
        delegate: recipeDelegate
    }
}
