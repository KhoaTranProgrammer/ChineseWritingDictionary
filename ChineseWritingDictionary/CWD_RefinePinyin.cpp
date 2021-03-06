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
 * This file contains implementation of Refine Pinyin processing              *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-04-2021: Initial version                                               *
 *              - Support convert string input to Pinyin display              *
 *****************************************************************************/

#include "CWD_RefinePinyin.h"

CWD_RefinePinyin::CWD_RefinePinyin()
{

}

QString CWD_RefinePinyin::convert(QString input) // [Luo2 mi3 ou1 yu3 Zhu1 li4 ye4]
{
    QString result = "[";

    QString strPro = input.remove(0 , 1); // Luo2 mi3 ou1 yu3 Zhu1 li4 ye4]
    strPro = strPro.remove(strPro.length() - 1, 1); // Luo2 mi3 ou1 yu3 Zhu1 li4 ye4

    QStringList res_split = strPro.split(" ");
    for(int i = 0; i < res_split.length(); i++) {
        QString curStr = res_split[i];
        QChar temp = curStr.at(curStr.length() - 1);
        if(temp != '0' && temp != '1' && temp != '2' && temp != '3' && temp != '4' && temp != '5'){
            result += curStr;
        }else{
            result += convertonechar(curStr);
        }
        if(i < (res_split.length() - 1)) result += " ";
    }

    result += "]";
    return result;
}

QString CWD_RefinePinyin::convertonechar(QString input)
{
    QString m_initial = input;
    QString m_final = input;
    if(input.contains("ch") || input.contains("Ch")) {
        m_initial = m_initial.remove(2, input.length() - 2);
        m_final = m_final.remove(0, 2);
    }else if(input.contains("sh") || input.contains("Sh")) {
        m_initial = m_initial.remove(2, input.length() - 2);
        m_final = m_final.remove(0, 2);
    }else if(input.contains("zh") || input.contains("Zh")) {
        m_initial = m_initial.remove(2, input.length() - 2);
        m_final = m_final.remove(0, 2);
    }else if(input.contains("b") || input.contains("B")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("c") || input.contains("C")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("d") || input.contains("D")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("f") || input.contains("F")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("g") || input.contains("G")) {
        m_initial = input.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("h") || input.contains("H")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("j") || input.contains("J")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("k") || input.contains("K")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("l") || input.contains("L")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("m") || input.contains("M")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("n") || input.contains("N")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("p") || input.contains("P")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("q") || input.contains("Q")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("r") || input.contains("R")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("s") || input.contains("S")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("t") || input.contains("T")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("y") || input.contains("Y")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("x") || input.contains("X")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("z") || input.contains("Z")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else if(input.contains("w") || input.contains("W")) {
        m_initial = m_initial.remove(1, input.length() - 1);
        m_final = m_final.remove(0, 1);
    }else {
        m_initial = "";
        m_final = input;
    }

    if((m_initial == "r" && m_final == "5") || (m_initial == "R" && m_final == "5")) {
        return m_initial;
    }
    m_final = convertoneFinal(m_final);
    return m_initial + m_final;
}

QString CWD_RefinePinyin::convertoneFinal(QString input)
{
    QString result = "temp";
    QChar m_tones = input.at(input.length() - 1);

    if(input.contains("iang")){
        if(m_tones == '1') return "i??ng";
        if(m_tones == '2') return "i??ng";
        if(m_tones == '3') return "i??ng";
        if(m_tones == '4') return "i??ng";
        if(m_tones == '5') return "iang";
    }else if(input.contains("iong")){
        if(m_tones == '1') return "i??ng";
        if(m_tones == '2') return "i??ng";
        if(m_tones == '3') return "i??ng";
        if(m_tones == '4') return "i??ng";
        if(m_tones == '5') return "iong";
    }else if(input.contains("uang")){
        if(m_tones == '1') return "u??ng";
        if(m_tones == '2') return "u??ng";
        if(m_tones == '3') return "u??ng";
        if(m_tones == '4') return "u??ng";
        if(m_tones == '5') return "uang";
    }else if(input.contains("ueng")){
        if(m_tones == '1') return "u??ng";
        if(m_tones == '2') return "u??ng";
        if(m_tones == '3') return "u??ng";
        if(m_tones == '4') return "u??ng";
        if(m_tones == '5') return "ueng";
    }else if(input.contains("ang")){
        if(m_tones == '1') return "??ng";
        if(m_tones == '2') return "??ng";
        if(m_tones == '3') return "??ng";
        if(m_tones == '4') return "??ng";
        if(m_tones == '5') return "ang";
    }else if(input.contains("anr")){
        if(m_tones == '1') return "??nr";
        if(m_tones == '2') return "??nr";
        if(m_tones == '3') return "??nr";
        if(m_tones == '4') return "??nr";
        if(m_tones == '5') return "anr";
    }else if(input.contains("eng")){
        if(m_tones == '1') return "??ng";
        if(m_tones == '2') return "??ng";
        if(m_tones == '3') return "??ng";
        if(m_tones == '4') return "??ng";
        if(m_tones == '5') return "eng";
    }else if(input.contains("ian")){
        if(m_tones == '1') return "i??n";
        if(m_tones == '2') return "i??n";
        if(m_tones == '3') return "i??n";
        if(m_tones == '4') return "i??n";
        if(m_tones == '5') return "ian";
    }else if(input.contains("iao")){
        if(m_tones == '1') return "i??o";
        if(m_tones == '2') return "i??o";
        if(m_tones == '3') return "i??o";
        if(m_tones == '4') return "i??o";
        if(m_tones == '5') return "iao";
    }else if(input.contains("ing")){
        if(m_tones == '1') return "??ng";
        if(m_tones == '2') return "??ng";
        if(m_tones == '3') return "??ng";
        if(m_tones == '4') return "??ng";
        if(m_tones == '5') return "ing";
    }else if(input.contains("iou")){
        if(m_tones == '1') return "i??u";
        if(m_tones == '2') return "i??u";
        if(m_tones == '3') return "i??u";
        if(m_tones == '4') return "i??u";
        if(m_tones == '5') return "iou";
    }else if(input.contains("ong")){
        if(m_tones == '1') return "??ng";
        if(m_tones == '2') return "??ng";
        if(m_tones == '3') return "??ng";
        if(m_tones == '4') return "??ng";
        if(m_tones == '5') return "ong";
    }else if(input.contains("uai")){
        if(m_tones == '1') return "u??i";
        if(m_tones == '2') return "u??i";
        if(m_tones == '3') return "u??i";
        if(m_tones == '4') return "u??i";
        if(m_tones == '5') return "uai";
    }else if(input.contains("uan")){
        if(m_tones == '1') return "u??n";
        if(m_tones == '2') return "u??n";
        if(m_tones == '3') return "u??n";
        if(m_tones == '4') return "u??n";
        if(m_tones == '5') return "uan";
    }else if(input.contains("u:an")){
        if(m_tones == '1') return "????n";
        if(m_tones == '2') return "????n";
        if(m_tones == '3') return "????n";
        if(m_tones == '4') return "????n";
        if(m_tones == '5') return "??an";
    }else if(input.contains("uar")){
        if(m_tones == '1') return "u??r";
        if(m_tones == '2') return "u??r";
        if(m_tones == '3') return "u??r";
        if(m_tones == '4') return "u??r";
        if(m_tones == '5') return "uar";
    }else if(input.contains("uen")){
        if(m_tones == '1') return "u??n";
        if(m_tones == '2') return "u??n";
        if(m_tones == '3') return "u??n";
        if(m_tones == '4') return "u??n";
        if(m_tones == '5') return "uen";
    }else if(input.contains("u:n")){
        /*if(m_tones == '1') return "";
        if(m_tones == '2') return "";*/
        if(m_tones == '3') return "??n";
        if(m_tones == '4') return "??n";
        if(m_tones == '5') return "??n";
    }else if(input.contains("u:e")){
        /*if(m_tones == '1') return "";
        if(m_tones == '2') return "";*/
        if(m_tones == '3') return "??e";
        if(m_tones == '4') return "??e";
        if(m_tones == '5') return "??e";
    }else if(input.contains("ai")){
        if(m_tones == '1') return "??i";
        if(m_tones == '2') return "??i";
        if(m_tones == '3') return "??i";
        if(m_tones == '4') return "??i";
        if(m_tones == '5') return "ai";
    }else if(input.contains("an")){
        if(m_tones == '1') return "??n";
        if(m_tones == '2') return "??n";
        if(m_tones == '3') return "??n";
        if(m_tones == '4') return "??n";
        if(m_tones == '5') return "an";
    }else if(input.contains("ao")){
        if(m_tones == '1') return "??o";
        if(m_tones == '2') return "??o";
        if(m_tones == '3') return "??o";
        if(m_tones == '4') return "??o";
        if(m_tones == '5') return "ao";
    }else if(input.contains("ar")){
        if(m_tones == '1') return "??r";
        if(m_tones == '2') return "??r";
        if(m_tones == '3') return "??r";
        if(m_tones == '4') return "??r";
        if(m_tones == '5') return "ar";
    }else if(input.contains("ei")){
        if(m_tones == '1') return "??i";
        if(m_tones == '2') return "??i";
        if(m_tones == '3') return "??i";
        if(m_tones == '4') return "??i";
        if(m_tones == '5') return "ei";
    }else if(input.contains("en")){
        if(m_tones == '1') return "??n";
        if(m_tones == '2') return "??n";
        if(m_tones == '3') return "??n";
        if(m_tones == '4') return "??n";
        if(m_tones == '5') return "en";
    }else if(input.contains("er")){
        if(m_tones == '1') return "??r";
        if(m_tones == '2') return "??r";
        if(m_tones == '3') return "??r";
        if(m_tones == '4') return "??r";
        if(m_tones == '5') return "er";
    }else if(input.contains("ia")){
        if(m_tones == '1') return "i??";
        if(m_tones == '2') return "i??";
        if(m_tones == '3') return "i??";
        if(m_tones == '4') return "i??";
        if(m_tones == '5') return "ia";
    }else if(input.contains("ie")){
        if(m_tones == '1') return "i??";
        if(m_tones == '2') return "i??";
        if(m_tones == '3') return "i??";
        if(m_tones == '4') return "i??";
        if(m_tones == '5') return "ie";
    }else if(input.contains("in")){
        if(m_tones == '1') return "??n";
        if(m_tones == '2') return "??n";
        if(m_tones == '3') return "??n";
        if(m_tones == '4') return "??n";
        if(m_tones == '5') return "in";
    }else if(input.contains("iu")){
        if(m_tones == '1') return "i??";
        if(m_tones == '2') return "i??";
        if(m_tones == '3') return "i??";
        if(m_tones == '4') return "i??";
        if(m_tones == '5') return "iu";
    }else if(input.contains("ou")){
        if(m_tones == '1') return "??u";
        if(m_tones == '2') return "??u";
        if(m_tones == '3') return "??u";
        if(m_tones == '4') return "??u";
        if(m_tones == '5') return "ou";
    }else if(input.contains("ua")){
        if(m_tones == '1') return "u??";
        if(m_tones == '2') return "u??";
        if(m_tones == '3') return "u??";
        if(m_tones == '4') return "u??";
        if(m_tones == '5') return "ua";
    }else if(input.contains("ue")){
        if(m_tones == '1') return "u??";
        if(m_tones == '2') return "u??";
        if(m_tones == '3') return "u??";
        if(m_tones == '4') return "u??";
        if(m_tones == '5') return "ue";
    }else if(input.contains("ui")){
        if(m_tones == '1') return "u??";
        if(m_tones == '2') return "u??";
        if(m_tones == '3') return "u??";
        if(m_tones == '4') return "u??";
        if(m_tones == '5') return "ui";
    }else if(input.contains("un")){
        if(m_tones == '1') return "??n";
        if(m_tones == '2') return "??n";
        if(m_tones == '3') return "??n";
        if(m_tones == '4') return "??n";
        if(m_tones == '5') return "un";
    }else if(input.contains("uo")){
        if(m_tones == '1') return "u??";
        if(m_tones == '2') return "u??";
        if(m_tones == '3') return "u??";
        if(m_tones == '4') return "u??";
        if(m_tones == '5') return "uo";
    }else if(input.contains("u:")) {
        /*if(m_tones == '1') return "";
        if(m_tones == '2') return "";*/
        if(m_tones == '3') return "??";
        if(m_tones == '4') return "??";
        if(m_tones == '5') return "??";
    }else if(input.contains("a")){
        if(m_tones == '1') return "??";
        if(m_tones == '2') return "??";
        if(m_tones == '3') return "??";
        if(m_tones == '4') return "??";
        if(m_tones == '5') return "a";
    }else if(input.contains("e")){
        if(m_tones == '1') return "??";
        if(m_tones == '2') return "??";
        if(m_tones == '3') return "??";
        if(m_tones == '4') return "??";
        if(m_tones == '5') return "e";
    }else if(input.contains("i")){
        if(m_tones == '1') return "??";
        if(m_tones == '2') return "??";
        if(m_tones == '3') return "??";
        if(m_tones == '4') return "??";
        if(m_tones == '5') return "i";
    }else if(input.contains("o")){
        if(m_tones == '1') return "??";
        if(m_tones == '2') return "??";
        if(m_tones == '3') return "??";
        if(m_tones == '4') return "??";
        if(m_tones == '5') return "o";
    }else if(input.contains("u")) {
        if (m_tones == '1') return "??";
        if (m_tones == '2') return "??";
        if (m_tones == '3') return "??";
        if (m_tones == '4') return "??";
        if (m_tones == '5') return "u";
    }
    return input;
}

