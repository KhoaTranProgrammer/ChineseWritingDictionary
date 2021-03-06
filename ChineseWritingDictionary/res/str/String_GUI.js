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
 * [1.0.3]                                                                    *
 * Oct-04-2021: Support For Stroke                                            *
 *              - Add detail_writing_title                                    *
 * [1.0.4]                                                                    *
 * Nov-28-2021: Support Information with Radical                              *
 *              - Add information_types                                       *
 *              - Add radicals_list, radicals_stroke, radicals_pinyin,        *
 *                radicals_english                                            *
 * [1.0.5]                                                                    *
 * Nov-28-2021: Support Information With Introduction                         *
 *              - Append information_types                                    *
 *              - Add introduction_english                                    *
 * [1.0.6]                                                                    *
 * Dec-01-2021: Support Information With History                              *
 *              - Append information_types                                    *
 * [1.0.7]                                                                    *
 * Dec-03-2021: Support Information With Help                                 *
 *              - Append information_types                                    *
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
    "ic_history.png", "CWD_History.qml",
    "ic_radical.png", "CWD_Radical.qml",
    "ic_info.png", "CWD_Introduction.qml",
    "ic_help.png", "CWD_Help.qml"
]

var radicals_list = [
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

var introduction_english =
"How to write Chinese words are the most difficult, and also are the most interesting of studying Chinese language.\nFor this purpose, \'Chinese Writing Dictionary\' application is created to introduce how to write Chinese words." +
"\nThis is free software, refers the database from website: https://www.mdbg.net/chindict/chindict.php?page=cedict and revise to add Vietnamese meaning." +
"\nSupports to look up by 4 methods: Chinese, Pinyin, English, Vietnamese." +
"\nGuides to write for more than 5000 Chinese characters." +
"\n\nIf you have any comment/concern, please contact us via: tudienchuviettienghoa@gmail.com"
