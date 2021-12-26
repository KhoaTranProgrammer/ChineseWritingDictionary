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
            "一", "〡", "丶", "丿", "乙", "亅",
            "二", "亠", "人(亻)", "儿", "入", "八", "冂", "冖", "冫", "几", "凵", "刀(刂)", "力", "勹", "匕", "匚", "匸", "十", "卜", "卩", "厂", "厶", "又",
            "口", "囗", "土", "士", "夂", "夊", "夕", "大", "女", "子", "宀", "寸", "小", "尢", "尸", "屮", "山", "巛", "工", "己", "巾", "干", "幺", "广", "廴", "廾", "弋", "弓", "彐", "彡", "彳",
            "心(忄)", "戈", "戶", "手(扌)", "支", "攴(攵)", "文", "斗", "斤", "方", "无", "日", "曰", "月", "木", "欠", "止", "歹", "殳", "毋", "比", "毛", "氏", "气", "水(氵)", "火(灬)", "爪", "父", "爻", "爿(丬)", "片", "牙", "牛(牜)", "犬(犭)",
            "玄", "玉", "瓜", "瓦", "甘", "生", "用", "田", "疋(匹)", "疒", "癶", "白", "皮", "皿", "目", "矛", "矢", "石", "示(礻)", "禸", "禾", "穴", "立",
            "竹", "米", "糸", "缶", "网", "羊", "羽", "老", "而", "耒", "耳", "聿", "肉", "臣", "自", "至", "臼", "舌", "舛", "舟", "艮", "色", "艸(艹)", "虍", "虫", "血", "行", "衣(衤)", "襾",
            "見(见)", "角", "言(讠)", "谷", "豆", "豕", "豸", "貝(贝)", "赤", "走", "足", "身", "車(车)", "辛", "辰", "辵(辶)", "邑(阝)", "酉", "釆", "里",
            "金", "長(镸-长)", "門(门)", "阜(阝)", "隶", "隹", "雨", "青(靑)", "非",
            "面(靣)", "革", "韋(韦)", "韭", "音", "頁(页)", "風(凬-风)", "飛(飞)", "食(飠-饣)", "首", "香",
            "馬(马)", "骫", "高", "髟", "鬥", "鬯", "鬲", "鬼",
            "魚(鱼)", "鳥(鸟)", "鹵", "鹿", "麥(麦)", "麻",
            "黃", "黍", "黑", "黹",
            "黽", "鼎", "鼓", "鼠",
            "鼻", "齊(斉-齐)",
            "齒(歯-齿)",
            "龍(龙)", "龜(亀-龟)",
            "龠"
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
            "yi", "kǔn", "zhǔ", "piě", "yī", "jué", //1
            "èr", "tóu", "rén", "rén", "rù", "bā", "jiǒng", "mì", "bīng", "jī", "kǎn", "dāo", "lì", "bā", "bǐ", "fāng", "xǐ", "shí", "bǔ", "jié", "hàn", "sī", "yòu", //2
            "kǒu", "wéi", "tǔ", "shì", "zhǐ", "sūi", "xì", "dà", "nǚ", "zǐ", "mián", "cùn", "xiǎo", "wāng", "shī", "chè", "shān", "chuān", "gōng", "jǐ", "jīn", "gān", "yāo", "ān", "yǐn", "gǒng", "yì", "gōng", "jì", "shān", "chì", //3
            "xīn", "gē", "hù", "shǒu", "zhī", "pù", "wén", "dōu", "jīn", "fāng", "wú", "rì", "yuē", "yuè", "mù", "qiàn", "zhǐ", "dǎi", "shū", "wú", "bǐ", "máo", "shì", "qì", "shǔi", "huǒ", "zhǎo", "fù", "yáo", "qiáng", "piàn", "yá", "níu", "quǎn", //4
            "xuán", "yù", "guā", "wǎ", "gān", "shēng", "yòng", "tián", "pǐ", "nǐ", "bǒ", "bái", "pí", "mǐn", "mù", "máo", "shǐ", "shí", "shì", "róu", "hé", "xué", "lì", //5
            "zhú", "mǐ", "mì", "fǒu", "wǎng", "yáng", "yǔ", "lǎo", "ér", "lěi", "ěr", "yù", "ròu", "chén", "zì", "zhì", "jiù", "shé", "chuǎn", "zhōu", "gèn", "sè", "cǎo", "Hū", "chóng", "xuè", "xíng", "yī", "yà", //6
            "jiàn", "jué", "yán", "gǔ", "dòu", "shǐ", "zhì", "bèi", "chì", "zǒu", "zú", "shēn", "chē", "xīn", "chén", "chuò", "yì", "yǒu", "biàn", "lǐ", //7
            "jīn", "cháng", "mén", "fù", "dài", "zhuī", "yǔ", "qīng", "fēi", //8
            "miàn", "gé", "wéi", "jiǔ", "yīn", "yè", "fēng", "fēi", "shí", "shǒu", "xiāng", //9
            "mǎ", "gǔ", "gāo", "biāo", "dòu", "chàng", "gé lì", "gǔi", //10
            "yú", "niǎo", "lǔ", "lù", "mò", "má", //11
            "huáng", "shǔ", "hēi", "zhǐ", //12
            "mǐn", "dǐng", "gǔ", "shǔ", //13
            "bí", "qí", //14
            "chǐ", //15
            "lóng", "guī", //16
            "yuè", //17
        ]

        property var radicals_english: [
            qsTr("one"), qsTr("line"), qsTr("dot"), qsTr("down stroke"), qsTr("second"), qsTr("hook"),
            qsTr("two"), qsTr("head (lid)"), qsTr("man"), qsTr("son"), qsTr("enter"), qsTr("eight"), qsTr("outskirts"), qsTr("cover (冖)"), qsTr("ice"), qsTr("table"), qsTr("hole"), qsTr("knife"), qsTr("power"), qsTr("wrap"), qsTr("spoon"), qsTr("box"), qsTr("hide"), qsTr("ten"), qsTr("divination"), qsTr("seal"), qsTr("cliff"), qsTr("private"), qsTr("right hand"),
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
