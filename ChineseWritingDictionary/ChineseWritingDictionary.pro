#/*
# * MIT License
# *
# * Copyright (c) 2021 KhoaTran Programmer
# *
# * Permission is hereby granted, free of charge, to any person obtaining a copy
# * of this software and associated documentation files (the "Software"), to deal
# * in the Software without restriction, including without limitation the rights
# * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# * copies of the Software, and to permit persons to whom the Software is
# * furnished to do so, subject to the following conditions:
# *
# * The above copyright notice and this permission notice shall be included in all
# * copies or substantial portions of the Software.
# *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# * SOFTWARE.
# */

#/******************************************************************************
# * PURPOSE                                                                    *
# ******************************************************************************
# * This file is automatically created by Qt Creator for building configuration*
# *****************************************************************************/

#/******************************************************************************
# * VERSION HISTORY                                                            *
# ******************************************************************************
# * [1.0.0]                                                                    *
# * Sep-25-2021: Initial version                                               *
# *              - Automatically created by Qt Creator                         *
# * [1.0.1]                                                                    *
# * Sep-26-2021: Add database processing                                       *
# *              - Add CWD_DatabaseClass, CWD_GlobalVariableClass              *
# *              - Add sql library                                             *
# *              Add CWD_DEBUG macro                                           *
# * [1.0.2]                                                                    *
# * Dec-27-2021: Support Build For Android                                     *
# *              - Add Android build folder                                    *
# *****************************************************************************/

QT += quick multimedia
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    CWD_DatabaseClass.cpp \
    CWD_GlobalVariableClass.cpp \
    CWD_WritingCharacter.cpp \
    CWD_WritingImage.cpp \
    CWD_HistoryDatabase.cpp \
    CWD_CharacterDetection.cpp \
    CWD_RefinePinyin.cpp

RESOURCES += qml.qrc
RESOURCES += audio.qrc
RESOURCES += data.qrc

QT += sql

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    CWD_DatabaseClass.h \
    CWD_GlobalVariableClass.h \
    CWD_Database.h \
    CWD_WritingCharacter.h \
    CWD_WritingImage.h \
    CWD_HistoryDatabase.h \
    CWD_CharacterDetection.h \
    CWD_RefinePinyin.h \
    CWD_LanguageType.h \
    CWD_Translator.h

debug {
  DEFINES += CWD_DEBUG
}

TRANSLATIONS = translator/ChineseWritingDictionary_VIE.ts

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
