/*
 * MIT License
 *
 * Copyright (c) 2021-2022 KhoaTran Programmer
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
 * This file is the main function of Chinese Writing Dictionary               *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-25-2021: Initial version                                               *
 *              - Show up main screen, set application size                   *
 * [1.0.1]                                                                    *
 * Sep-26-2021: Load database processing                                      *
 *              - Create database connection                                  *
 *              - Load database with root QQuickItem                          *
 *              - Set context property to database                            *
 * [1.0.2]                                                                    *
 * Oct-04-2021: Support Display Strokes                                       *
 *              - Add header CWD_WritingCharacter.h                           *
 *              - Set context property to myWriting                           *
 *              - Register CWD_WritingImage QML type                          *
 * [1.0.3]                                                                    *
 * Dec-01-2021: Support History                                               *
 *              - Add CWD_HistoryDatabase QML type                            *
 * [1.0.4]                                                                    *
 * Dec-02-2021: Support Brush Hanzi Character                                 *
 *              - Set Character Detection object                              *
 * [1.0.5]                                                                    *
 * Dec-04-2021: Support Refine Pinyin                                         *
 *              - Set Pinyin Refine object                                    *
 * [1.0.6]                                                                    *
 * Dec-05-2021: Support Transition For Multi Languages                        *
 *              - Register CWD_LanguageType QML Type                          *
 *              - Set Translator object                                       *
 * [1.0.7]                                                                    *
 * Feb-17-2022: Support Display Radical And Number Of Strokes For Character   *
 *              - Set Radical object                                          *
 *****************************************************************************/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QTextCodec>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QtQuick>
#include "CWD_Database.h"
#include "CWD_DatabaseClass.h"
#include "CWD_WritingCharacter.h"
#include "CWD_WritingImage.h"
#include "CWD_HistoryDatabase.h"
#include "CWD_CharacterDetection.h"
#include "CWD_RefinePinyin.h"
#include "CWD_LanguageType.h"
#include "CWD_Translator.h"
#include "CWD_Radical.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;

    qmlRegisterType<CWD_LanguageType>("CWD_LanguageType", 1, 0, "CWD_LanguageType");

    // Set Translator object
    CWD_Translator mTrans(&app);
    view.engine()->rootContext()->setContextProperty("mytrans", &mTrans);

    // Register CWD_WritingImage QML type
    qmlRegisterType<CWD_WritingImage>("CWD_WritingImage", 1, 0, "CWD_WritingImage");

    // Register CWD_History QML type
    qmlRegisterType<CWD_HistoryDatabase>("CWD_HistoryDatabase", 1, 0, "CWD_HistoryDatabase");

    // Set main qml screen
    view.setSource(QUrl("qrc:///main.qml"));

    // Create database connection
    if (!CWD_createConnection())
        return EXIT_FAILURE;

    // Load database with root QQuickItem
    CWD_DatabaseClass myDataBase(view.rootObject());
    myDataBase.start();

    // Set context property to database
    view.engine()->rootContext()->setContextProperty("myDataBase", &myDataBase);

    // Set context property to myWriting
    CWD_WritingCharacter myWriting;
    view.engine()->rootContext()->setContextProperty("myWriting", &myWriting);

    // Set Character Detection object
    CWD_CharacterDetection myChaDet;
    view.engine()->rootContext()->setContextProperty("myChaDet", &myChaDet);

    // Set Pinyin Refine object
    CWD_RefinePinyin myPyRe;
    view.engine()->rootContext()->setContextProperty("myPyRe", &myPyRe);

    // Set Radical object
    CWD_Radical myRadical;
    view.engine()->rootContext()->setContextProperty("myRadical", &myRadical);

    // Set application size
    view.setMinimumSize(QSize(720*0.75, 1080*0.75));

    // Display application
    view.show();

    return app.exec();
}
