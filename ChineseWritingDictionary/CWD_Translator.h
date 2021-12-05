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
 * This is tranlator class to support multi languages                         *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Support English and Vietnamese                              *
 *****************************************************************************/

#ifndef CWD_TRANSLATOR_H
#define CWD_TRANSLATOR_H

#include <QObject>
#include <QGuiApplication>
#include <QQuickView>
#include <QTranslator>
#include "CWD_LanguageType.h"

class CWD_Translator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
    CWD_Translator(QGuiApplication* app) { mApp = app; }

    QString getEmptyString() { return ""; }

signals:
    void languageChanged();

public slots:
    void updateLanguage(int lang){
        switch(lang){
        case CWD_LanguageType::VIE:
            mTranslator.load("ChineseWritingDictionary_VIE", ":/translator");
            mApp->installTranslator(&mTranslator);
            break;
        default:
            mApp->removeTranslator(&mTranslator);
            break;
        }
        emit languageChanged();
    }

private:
    QGuiApplication* mApp;
    QTranslator mTranslator;
};

#endif // CWD_TRANSLATOR_H
