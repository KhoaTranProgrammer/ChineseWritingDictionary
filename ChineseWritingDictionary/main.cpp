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

int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);
    QQuickView view;

    // Register CWD_WritingImage QML type
    qmlRegisterType<CWD_WritingImage>("CWD_WritingImage", 1, 0, "CWD_WritingImage");

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

    // Set application size
    view.setMinimumSize(QSize(720*0.75, 1080*0.75));

    // Display application
    view.show();

    return app.exec();
}
