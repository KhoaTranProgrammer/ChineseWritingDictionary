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
 * This file uses to define string using for GUI                              *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-25-2021: Initial version                                               *
 *              - Add app_title                                               *
 * [1.0.1]                                                                    *
 * Sep-26-2021: Support searching                                             *
 *              - Add search_title, search_types                              *
 * [1.0.2]                                                                    *
 * Oct-04-2021: Support detail                                                *
 *              - Add detail_title, detail_trad, detail_pinyin,               *
 *                detail_vietnamese, detail_english                           *
 * [1.0.2]                                                                    *
 * Oct-04-2021: Support For Stroke                                            *
 *              - Add detail_writing_title                                    *
 * [1.0.3]                                                                    *
 * Nov-28-2021: Support Information with Radical                              *
 *              - Add information_types                                       *
 *              - Add radicals_list, radicals_stroke, radicals_pinyin,        *
 *                radicals_english                                            *
 *****************************************************************************/

var app_title = "Chinese Writing Dictionary"

var search_title = "Search by"
var search_types = [
   "Chinese", "Type Chinese Word",
   "Pinyin", "Type Pinyin",
   "Vietnamese", "Type Vietnamese Word",
   "English", "Type English Word"
]

var detail_title = "Detail"
var detail_trad = "Traditional"
var detail_pinyin = "Pinyin"
var detail_vietnamese = "Vietnamese Meaning"
var detail_english = "English Meaning"
var detail_writing_title = "How to write?"

var information_types = [
    "ic_radical.png", "CWD_Radical.qml"
]

var radicals_list = [
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

var radicals_stroke = [
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

var radicals_pinyin = [
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

var radicals_english = [
    "one", "line", "dot", "down stroke", "second", "hook",
    "two", "head", "man", "son", "enter", "eight", "outskirts", "cover", "ice", "table", "hole", "knife", "power", "wrap", "spoon", "box", "hide", "ten", "divination", "seal", "cliff", "private", "right hand",
    "mouse", "enclosure", "earth", "scholar", "go", "walk slowly", "evening", "big", "woman", "child", "roof", "thumb", "small", "lame", "corpse", "sprout", "mountain", "river", "work", "oneself", "scarf", "dry", "little", "shelter", "draw", "hands joined", "shoot", "bow", "snow", "hair", "step",
    "heart", "spear", "family", "hand", "branch", "knock", "literature", "dipper", "axe", "square", "none", "sun", "say", "moon", "tree", "yawn", "stop", "bad", "lance", "do not", "compare", "hair", "clan", "steam", "water", "fire", "claw", "father", "trigram", "bed", "slice", "tooth", "cow", "dog",
    "profound", "jade", "melon", "watt", "sweet", "life", "use", "field", "cloth", "illness", "footsteps", "white", "skin", "dish", "eye", "spear", "arrow", "stone", "sign", "trample", "grain", "cave", "stand",
    "bamboo", "rice", "silk", "jar", "net", "sheep", "feather", "old", "beard", "plow", "ear", "brush", "meat", "minister", "self", "arrive", "mortar", "tongue", "error", "boat", "hill", "color", "grass", "tiger", "insect", "blood", "walk", "clothes", "cover",
    "look", "horn", "speech", "valley", "bean", "pig", "insect without feet", "shell", "red", "run", "foot", "body", "car", "bitter", "morning", "walk", "town", "wine", "pick", "village",
    "gold", "long", "door", "mound", "slave", "short-tailed bird", "rain", "green or blue", "none",
    "face", "rawhide", "leather", "leek", "sound", "page", "wind", "fly", "food", "head", "fragrant",
    "horse", "bent", "tall", "hair", "fight", "sacrificial spirit", "earthen pot", "ghost",
    "fish", "bird", "halogen", "deer", "wheat", "hemp",
    "yellow", "millet", "black", "embroidery",
    "toad", "tripod", "drum", "rat",
    "nose", "together",
    "tooth",
    "dragon", "turtle",
    "flute",
]
