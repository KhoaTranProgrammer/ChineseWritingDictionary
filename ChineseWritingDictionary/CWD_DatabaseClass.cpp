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
 * This file implements as declaration in header of database processing       *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Sep-26-2021: Initial version                                               *
 *              - Implement CWD_DatabaseClass/addWord/run                     *
 * [1.0.1]                                                                    *
 * Oct-02-2021: Get searching result                                          *
 *              - Implement slot getWordMatches                               *
 *              - Support searching by English                                *
 *****************************************************************************/

#include "CWD_DatabaseClass.h"
#include <QFile>
#include "CWD_Database.h"

CWD_DatabaseClass::CWD_DatabaseClass(QQuickItem* rootObject)
{
    QSqlQuery query;

    query.exec("create table " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + "(id int primary key, "
               + CWD_GlobalVariableClass::COL_CHINESE + " varchar(20)" + ", "
               + CWD_GlobalVariableClass::COL_CHINESE_TRA + " varchar(20)" + ", "
               + CWD_GlobalVariableClass::COL_PINYIN + " varchar(20)" + ", "
               + CWD_GlobalVariableClass::COL_ENGMEAN + " varchar(1024)" + ", "
               + CWD_GlobalVariableClass::COL_VIEMEAN + " varchar(1024)"
               + ")");

    model.setTable(CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE);
    model.select();

    // Setting QtQuick Item root object
    this->m_rootObject = rootObject;
}

void CWD_DatabaseClass::run()
{
    CWD_createConnection();

    // Get total number of record
    int count;
    QSqlQuery query1;
    query1.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE);
    query1.last();
    count = query1.value(0).toInt();
#if CWD_DEBUG
    qDebug() << "Number of record: " << count;
#endif

    QFile reader(":res/raw/definitions.txt");
    try {
        if(!reader.open(QIODevice::ReadOnly)) {
#if CWD_DEBUG
            qDebug() << "error: " << reader.errorString();
#endif
        } else {
            QTextStream in(&reader);

            // This is the first time add database
            if (count == 0) {
                while (!in.atEnd())
                {
                  QString line = in.readLine();
                  QStringList strings = line.split("\t");
                  if(strings.size() == 5) {
                      addWord(++count, strings[1], strings[0], strings[2], strings[3], strings[4]);
                  }
                }
            } else {
                // This is second time add database
                // Start reading all old lines
                for (int i = 0; i < count; i++) {
                    in.readLine();
                }

                // Add continues lines
                while (!in.atEnd())
                {
                    QString line = in.readLine();
                    QStringList strings = line.split("\t");
                    if(strings.size() == 5) {
                        addWord(++count, strings[1], strings[0], strings[2], strings[3], strings[4]);
                    }
                }
            }
            reader.close();
        }
    } catch(...) {
        reader.close();
    }
}

void CWD_DatabaseClass::addWord(int id, QString simplifyChi, QString traditionalChi, QString definition, QString engdef, QString vietdef)
{
#if CWD_DEBUG
    qDebug() << id << " - " << simplifyChi << " - " << traditionalChi;
#endif
    QSqlQuery query;
    query.exec("insert into " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " values(" +
               QString::number(id)
               + ", " + "'" + simplifyChi + "'"
               + ", " + "'" + traditionalChi + "'"
               + ", " + "'" + definition + "'"
               + ", " + "'" + engdef + "'"
               + ", " + "'" + vietdef + "'"
               + ")");
}

void CWD_DatabaseClass::getWordMatches(QString pattern, QString type)
{
#if CWD_DEBUG
    qDebug() << "getWordMatches: " << pattern << "," << type;
#endif
    CWD_createConnection();
    QSqlQuery query;

    if ( type == CWD_GlobalVariableClass::ENGLISH_TYPE ) {
        query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                     CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'% " + pattern + "%'" + " OR " +
                     CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'/" + pattern + "%'");
    }

    // Clear data
    QMetaObject::invokeMethod(this->m_rootObject, "clearData");

    // Send data to GUI to show up
    while (query.next()) {
#if CWD_DEBUG
        qDebug() << query.value(0).toString() << query.value(1).toString() << query.value(2).toString()  << query.value(3).toString() << query.value(4).toString() << query.value(5).toString();
#endif
        QMetaObject::invokeMethod(this->m_rootObject, "addOneRecord",
                                  Q_ARG(QVariant, query.value(1).toString()),
                                  Q_ARG(QVariant, query.value(2).toString()),
                                  Q_ARG(QVariant, query.value(3).toString()),
                                  Q_ARG(QVariant, query.value(5).toString()),
                                  Q_ARG(QVariant, query.value(4).toString())
                                  );
    }
}
