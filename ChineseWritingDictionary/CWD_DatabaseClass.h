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
 * This file contains header of database processing                           *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Create class CWD_DatabaseClass base on QThread              *
 *              - Declare CWD_DatabaseClass/addWord/run                       *
 *****************************************************************************/

#ifndef CWD_DATABASECLASS_H
#define CWD_DATABASECLASS_H

#include <QSqlRelationalTableModel>
#include <QModelIndex>
#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>
#include <QThread>
#include <QtQuick/QQuickItem>
#include <QObject>
#include "CWD_GlobalVariableClass.h"

class CWD_DatabaseClass : public QThread
{
    Q_OBJECT
public:
    CWD_DatabaseClass(QQuickItem* rootObject);

private:
    void addWord(int id, QString simplifyChi, QString traditionalChi, QString definition, QString engdef, QString vietdef);

    QSqlRelationalTableModel model;
    void run() override;

    QQuickItem* m_rootObject;
};

#endif // CWD_DATABASECLASS_H
