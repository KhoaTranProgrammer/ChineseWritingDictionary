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
 * [1.0.1]                                                                    *
 * Oct-02-2021: Get searching result                                          *
 *              - Add slot getWordMatches                                     *
 * [1.0.2]                                                                    *
 * Oct-03-2021: Improve English searching                                     *
 *              - Add searchByEnglish function for English searching          *
 * [1.0.3]                                                                    *
 * Nov-21-2021: Fix Sql Connection Issue                                      *
 *              - Add enum CWD_DBSTATE and variable mDBStatus                 *
 * [1.0.4]                                                                    *
 * Dec-03-2021: Support Searching By Hanzi                                    *
 *              - Add searchByHanzi function for Hanzi searching              *
 * [1.0.5]                                                                    *
 * Dec-03-2021: Support Searching By Pinyin                                   *
 *              - Add searchByPinyin function for Pinyin searching            *
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

    enum CWD_DBSTATE
    {
        CWD_ADDING,        // Adding data to database
        CWD_SEARCHING,     // Search data
    };

public slots:
    void getWordMatches(QString pattern, QString type);

private:
    void addWord(int id, QString simplifyChi, QString traditionalChi, QString definition, QString engdef, QString vietdef);
    QSqlQuery searchByEnglish(QString pattern);
    QSqlQuery searchByHanzi(QString pattern);
    QSqlQuery searchByPinyin(QString pattern);

    QSqlRelationalTableModel model;
    void run() override;

    QQuickItem* m_rootObject;
    CWD_DBSTATE mDBStatus = CWD_ADDING;
};

#endif // CWD_DATABASECLASS_H
