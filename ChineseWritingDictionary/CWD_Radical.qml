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
 * This file implements the control for user to view Radical information      *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Nov-28-2021: Initial version                                               *
 *              - Define Model and delegate for Radical ListElement           *
 *              - Load information types from String_GUI.js                   *
 * [1.0.1]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Apply qsTr function                                         *
 *              - Declare text internally                                     *
 * [1.0.2]                                                                    *
 * Dec-26-2021: Support Android Display                                       *
 *              - Update QML Text font pointSize to static                    *
 *****************************************************************************/

import QtQuick 2.0

Item {
    id: id_root

    QtObject {
        id: id_priv
        property var radicals_list: [
            "???", "???", "???", "???", "???", "???",
            "???", "???", "???(???)", "???", "???", "???", "???", "???", "???", "???", "???", "???(???)", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???",
            "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???",
            "???(???)", "???", "???", "???(???)", "???", "???(???)", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???(???)", "???(???)", "???", "???", "???", "???(???)", "???", "???", "???(???)", "???(???)",
            "???", "???", "???", "???", "???", "???", "???", "???", "???(???)", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???(???)", "???", "???", "???", "???",
            "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???", "???(???)", "???", "???", "???", "???", "???(???)", "???",
            "???(???)", "???", "???(???)", "???", "???", "???", "???", "???(???)", "???", "???", "???", "???", "???(???)", "???", "???", "???(???)", "???(???)", "???", "???", "???",
            "???", "???(???-???)", "???(???)", "???(???)", "???", "???", "???", "???(???)", "???",
            "???(???)", "???", "???(???)", "???", "???", "???(???)", "???(???-???)", "???(???)", "???(???-???)", "???", "???",
            "???(???)", "???", "???", "???", "???", "???", "???", "???",
            "???(???)", "???(???)", "???", "???", "???(???)", "???",
            "???", "???", "???", "???",
            "???", "???", "???", "???",
            "???", "???(???-???)",
            "???(???-???)",
            "???(???)", "???(???-???)",
            "???"
        ]

        property var radicals_stroke: [
            "1", "1", "1", "1", "1", "1",
            "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", //2
            "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", //3
            "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", //4
            "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", "5", //5
            "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", "6", //6
            "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", "7", //7
            "8", "8", "8", "8", "8", "8", "8", "8", "8", //8
            "9", "9", "9", "9", "9", "9", "9", "9", "9", "9", "9", //9
            "10", "10", "10", "10", "10", "10", "10", "10", //10
            "11", "11", "11", "11", "11", "11", //11
            "12", "12", "12", "12", //12
            "13", "13", "13", "13", //13
            "14", "14", //14
            "15", //15
            "16", "16", //16
            "17", //17
        ]

        property var radicals_pinyin: [
            "yi", "k??n", "zh??", "pi??", "y??", "ju??", //1
            "??r", "t??u", "r??n", "r??n", "r??", "b??", "ji??ng", "m??", "b??ng", "j??", "k??n", "d??o", "l??", "b??", "b??", "f??ng", "x??", "sh??", "b??", "ji??", "h??n", "s??", "y??u", //2
            "k??u", "w??i", "t??", "sh??", "zh??", "s??i", "x??", "d??", "n??", "z??", "mi??n", "c??n", "xi??o", "w??ng", "sh??", "ch??", "sh??n", "chu??n", "g??ng", "j??", "j??n", "g??n", "y??o", "??n", "y??n", "g??ng", "y??", "g??ng", "j??", "sh??n", "ch??", //3
            "x??n", "g??", "h??", "sh??u", "zh??", "p??", "w??n", "d??u", "j??n", "f??ng", "w??", "r??", "yu??", "yu??", "m??", "qi??n", "zh??", "d??i", "sh??", "w??", "b??", "m??o", "sh??", "q??", "sh??i", "hu??", "zh??o", "f??", "y??o", "qi??ng", "pi??n", "y??", "n??u", "qu??n", //4
            "xu??n", "y??", "gu??", "w??", "g??n", "sh??ng", "y??ng", "ti??n", "p??", "n??", "b??", "b??i", "p??", "m??n", "m??", "m??o", "sh??", "sh??", "sh??", "r??u", "h??", "xu??", "l??", //5
            "zh??", "m??", "m??", "f??u", "w??ng", "y??ng", "y??", "l??o", "??r", "l??i", "??r", "y??", "r??u", "ch??n", "z??", "zh??", "ji??", "sh??", "chu??n", "zh??u", "g??n", "s??", "c??o", "H??", "ch??ng", "xu??", "x??ng", "y??", "y??", //6
            "ji??n", "ju??", "y??n", "g??", "d??u", "sh??", "zh??", "b??i", "ch??", "z??u", "z??", "sh??n", "ch??", "x??n", "ch??n", "chu??", "y??", "y??u", "bi??n", "l??", //7
            "j??n", "ch??ng", "m??n", "f??", "d??i", "zhu??", "y??", "q??ng", "f??i", //8
            "mi??n", "g??", "w??i", "ji??", "y??n", "y??", "f??ng", "f??i", "sh??", "sh??u", "xi??ng", //9
            "m??", "g??", "g??o", "bi??o", "d??u", "ch??ng", "g?? l??", "g??i", //10
            "y??", "ni??o", "l??", "l??", "m??", "m??", //11
            "hu??ng", "sh??", "h??i", "zh??", //12
            "m??n", "d??ng", "g??", "sh??", //13
            "b??", "q??", //14
            "ch??", //15
            "l??ng", "gu??", //16
            "yu??", //17
        ]

        property var radicals_english: [
            qsTr("one"), qsTr("line"), qsTr("dot"), qsTr("down stroke"), qsTr("second"), qsTr("hook"),
            qsTr("two"), qsTr("head (lid)"), qsTr("man"), qsTr("son"), qsTr("enter"), qsTr("eight"), qsTr("outskirts"), qsTr("cover (???)"), qsTr("ice"), qsTr("table"), qsTr("hole"), qsTr("knife"), qsTr("power"), qsTr("wrap"), qsTr("spoon"), qsTr("box"), qsTr("hide"), qsTr("ten"), qsTr("divination"), qsTr("seal"), qsTr("cliff"), qsTr("private"), qsTr("right hand"),
            qsTr("mouse"), qsTr("enclosure"), qsTr("earth"), qsTr("scholar"), qsTr("go"), qsTr("walk slowly"), qsTr("evening"), qsTr("big"), qsTr("woman"), qsTr("child"), qsTr("roof"), qsTr("thumb"), qsTr("small"), qsTr("lame"), qsTr("corpse"), qsTr("sprout"), qsTr("mountain"), qsTr("river"), qsTr("work"), qsTr("oneself"), qsTr("scarf"), qsTr("dry"), qsTr("little"), qsTr("shelter"), qsTr("draw"), qsTr("hands joined"), qsTr("shoot"), qsTr("bow"), qsTr("snow"), qsTr("hair (bristle)"), qsTr("step"),
            qsTr("heart"), qsTr("spear (dagger-axe)"), qsTr("family"), qsTr("hand"), qsTr("branch"), qsTr("knock"), qsTr("literature"), qsTr("dipper"), qsTr("axe"), qsTr("square"), qsTr("none (no)"), qsTr("sun"), qsTr("say"), qsTr("moon"), qsTr("tree"), qsTr("yawn"), qsTr("stop"), qsTr("bad"), qsTr("lance"), qsTr("do not"), qsTr("compare"), qsTr("hair (feather)"), qsTr("clan"), qsTr("steam"), qsTr("water"), qsTr("fire"), qsTr("claw"), qsTr("father"), qsTr("trigram"), qsTr("bed"), qsTr("slice"), qsTr("tooth (ivory)"), qsTr("cow"), qsTr("dog"),
            qsTr("profound"), qsTr("jade"), qsTr("melon"), qsTr("watt"), qsTr("sweet"), qsTr("life"), qsTr("use"), qsTr("field"), qsTr("cloth"), qsTr("illness"), qsTr("footsteps"), qsTr("white"), qsTr("skin"), qsTr("dish"), qsTr("eye"), qsTr("spear"), qsTr("arrow"), qsTr("stone"), qsTr("sign"), qsTr("trample"), qsTr("grain"), qsTr("cave"), qsTr("stand"),
            qsTr("bamboo"), qsTr("rice"), qsTr("silk"), qsTr("jar"), qsTr("net"), qsTr("sheep"), qsTr("feather (wing)"), qsTr("old"), qsTr("beard"), qsTr("plow"), qsTr("ear"), qsTr("brush"), qsTr("meat"), qsTr("minister"), qsTr("self"), qsTr("arrive"), qsTr("mortar"), qsTr("tongue"), qsTr("error"), qsTr("boat"), qsTr("hill"), qsTr("color"), qsTr("grass"), qsTr("tiger"), qsTr("insect"), qsTr("blood"), qsTr("walk (go)"), qsTr("clothes"), qsTr("cover"),
            qsTr("look"), qsTr("horn"), qsTr("speech"), qsTr("valley"), qsTr("bean"), qsTr("pig"), qsTr("insect without feet"), qsTr("shell"), qsTr("red"), qsTr("run"), qsTr("foot"), qsTr("body"), qsTr("car"), qsTr("bitter"), qsTr("morning"), qsTr("walk"), qsTr("town"), qsTr("wine"), qsTr("pick"), qsTr("village"),
            qsTr("gold"), qsTr("long"), qsTr("door"), qsTr("mound"), qsTr("slave"), qsTr("short-tailed bird"), qsTr("rain"), qsTr("green or blue"), qsTr("none"),
            qsTr("face"), qsTr("rawhide"), qsTr("leather"), qsTr("leek"), qsTr("sound"), qsTr("page"), qsTr("wind"), qsTr("fly"), qsTr("food"), qsTr("head"), qsTr("fragrant"),
            qsTr("horse"), qsTr("bent"), qsTr("tall"), qsTr("hair"), qsTr("fight"), qsTr("sacrificial spirit"), qsTr("earthen pot"), qsTr("ghost"),
            qsTr("fish"), qsTr("bird"), qsTr("halogen"), qsTr("deer"), qsTr("wheat"), qsTr("hemp"),
            qsTr("yellow"), qsTr("millet"), qsTr("black"), qsTr("embroidery"),
            qsTr("toad"), qsTr("tripod"), qsTr("drum"), qsTr("rat"),
            qsTr("nose"), qsTr("together"),
            qsTr("tooth"),
            qsTr("dragon"), qsTr("turtle"),
            qsTr("flute"),
        ]
    }

    property int itemHeight: parent.height / 15

    signal close()

    // Load searching types when Component is in Completed state
    Component.onCompleted: {
        for( var i = 0; i < id_priv.radicals_list.length; i++) {
            id_listOfRadical.append({   "index": i+1,
                                        "radicalChar": id_priv.radicals_list[i],
                                        "stroke": id_priv.radicals_stroke[i],
                                        "pinyin": id_priv.radicals_pinyin[i],
                                        "meaning": id_priv.radicals_english[i]})
        }
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
    }

    // Contains the list of radical character
    ListModel {
        id: id_listOfRadical
    }

    // The definition of displaying of radical information
    Component {
        id: id_displayRadical

        Item {
            width: parent.width
            height: itemHeight

            Rectangle {

                anchors {
                    fill: parent
                }
                color: "transparent"
                radius: height * 0.1
                border {
                    width: height * 0.01
                    color: "black"
                }

                Rectangle {
                    id: id_index
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.1
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: index
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                Rectangle {
                    id: id_radical
                    anchors {
                        left: id_index.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.23
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: radicalChar
                        font.family: "Helvetica"
                        font.pointSize: 15
                        font.bold: parent.height
                    }
                }

                Rectangle {
                    id: id_stroke
                    anchors {
                        left: id_radical.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.1
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: stroke
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                Rectangle {
                    id: id_pinyin
                    anchors {
                        left: id_stroke.right
                        top: parent.top
                        bottom: parent.bottom
                    }
                    width: parent.width * 0.25
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: pinyin
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }

                Rectangle {
                    id: id_meaning
                    anchors {
                        left: id_pinyin.right
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }
                    color: "transparent"

                    Text {
                        anchors.centerIn: parent
                        text: qsTr(meaning) + mytrans.emptyString
                        font.family: "Helvetica"
                        font.pointSize: 12
                    }
                }
            }
        }
    }

    // Model and delegate will be combined inside Flickable
    Flickable {
        id: id_listView
        anchors {
            left: parent.left
            right: parent.right
            top: id_headerArea.bottom
            bottom: parent.bottom
        }
        contentHeight: id_listOfRadical.count * itemHeight
        clip: true

        Column {
            anchors.fill: parent
            Repeater {
                model: id_listOfRadical
                delegate: id_displayRadical
            }
        }
    }
}
