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
 * [1.0.2]                                                                    *
 * Oct-03-2021: Improve English searching                                     *
 *              - Implement searchByEnglish function for English searching    *
 *              - Only get result for full word matching                      *
 * [1.0.3]                                                                    *
 * Nov-21-2021: Fix Sql Connection Issue                                      *
 *              - Only add data to database when state is CWD_ADDING          *
 * [1.0.4]                                                                    *
 * Dec-03-2021: Fix Sql Database Add                                          *
 *              - Do not read definition.txt when completed add database      *
 * [1.0.5]                                                                    *
 * Dec-03-2021: Improve English Searching Result                              *
 *              - Add more searching pattern type                             *
 * [1.0.6]                                                                    *
 * Dec-03-2021: Support Searching By Hanzi                                    *
 *              - Implement searchByHanzi function for Hanzi searching        *
 *              - Call searchByHanzi inside getWordMatches                    *
 * [1.0.7]                                                                    *
 * Dec-03-2021: Support Searching By Pinyin                                   *
 *              - Add searchByPinyin function for Pinyin searching            *
 *              - Call searchByPinyin inside getWordMatches                   *
 * [1.0.8]                                                                    *
 * Dec-04-2021: Support Searching By Vietnamese                               *
 *              - Add searchByVietnamese function for Vietnamese searching    *
 *              - Call searchByVietnamese inside getWordMatches               *
 * [1.0.9]                                                                    *
 * Dec-04-2021: Do Not Call To Add DB After Complete                          *
 *              - Add mFinishedLoadDB variable to announce DB status          *
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
                        if (mDBStatus != CWD_ADDING) break;
                        addWord(++count, strings[1], strings[0], strings[2], strings[3], strings[4]);
                    }
                }
            } else if (count != 110081) {
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
                        if (mDBStatus != CWD_ADDING) break;
                        addWord(++count, strings[1], strings[0], strings[2], strings[3], strings[4]);
                    }
                }
            } else { // In case the number is 110081, database is completely loaded
                mFinishedLoadDB = true;
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
    if (mDBStatus == CWD_ADDING) {
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
}

void CWD_DatabaseClass::getWordMatches(QString pattern, QString type)
{
    if (pattern != "")
    {
        mDBStatus = CWD_SEARCHING;
        QThread::msleep(1000);
#if CWD_DEBUG
    qDebug() << "getWordMatches: " << pattern << "," << type;
#endif
        CWD_createConnection();
        QSqlQuery query;

        if ( type == CWD_GlobalVariableClass::ENGLISH_TYPE ) {
            query = searchByEnglish(pattern);
        } else if ( type == CWD_GlobalVariableClass::HANZI_TYPE ) {
            query = searchByHanzi(pattern);
        } else if ( type == CWD_GlobalVariableClass::PINYIN_TYPE ) {
            query = searchByPinyin(pattern);
        } else if ( type == CWD_GlobalVariableClass::VIETNAMESE_TYPE ) {
            query = searchByVietnamese(pattern);
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

        if (!mFinishedLoadDB)
        {
            mDBStatus = CWD_ADDING;
            QThread::msleep(1000);
            this->start();
        }
    }
}

QSqlQuery CWD_DatabaseClass::searchByEnglish(QString pattern)
{
    QSqlQuery query;

    query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'%/" + pattern + "/%'" + " OR " + // /Hello/
                 CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'%/" + pattern + " %'" + " OR " + // /Hello (world)/
                 CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'% " + pattern + "/%'" + " OR " + // / kitty/
                 CWD_GlobalVariableClass::COL_ENGMEAN + " LIKE " + "'% " + pattern + " %'"// / kitty /
              );

    return query;
}

QSqlQuery CWD_DatabaseClass::searchByHanzi(QString pattern)
{
    QSqlQuery query;

    query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_CHINESE + " LIKE " + "'%" + pattern + "%'"
              );

    return query;
}

QSqlQuery CWD_DatabaseClass::searchByPinyin(QString pattern)
{
    QSqlQuery query;

    QStringList fields = pattern.split(" ");

    if(fields.length() == 1) { //yi
        query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "]%'" + " OR " + //[yi]             //1
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + " %'" + " OR " + //[yi ...]         //2
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "1%'" + " OR " + //[yi1...]         //3
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "2%'" + " OR " + //[yi2...]         //4
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "3%'" + " OR " + //[yi3...]         //5
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "4%'" + " OR " + //[yi4...]         //6
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + pattern + "5%'" + " OR " + //[yi5...]         //7
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "]'"  + " OR " + //[dang yi]        //8
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + " %'" + " OR " + //[dang yi ...]    //9
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "1%'" + " OR " + //[dang yi1...]    //10
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "2%'" + " OR " + //[dang yi2...]    //11
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "3%'" + " OR " + //[dang yi3...]    //12
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "4%'" + " OR " + //[dang yi4...]    //13
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + pattern + "5%'"            //[dang yi5...]    //14
              );
    } else if(fields.length() == 2) { //zao3 shang
        query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + " "  + fields[1] + "%'" + " OR " + //[zao shang...]     //1
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + "1 " + fields[1] + "%'" + " OR " + //[zao1 shang...]    //2
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + "2 " + fields[1] + "%'" + " OR " + //[zao2 shang...]    //3
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + "3 " + fields[1] + "%'" + " OR " + //[zao3 shang...]    //4
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + "4 " + fields[1] + "%'" + " OR " + //[zao4 shang...]    //5
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%[" + fields[0] + "5 " + fields[1] + "%'" + " OR " + //[zao5 shang...]    //6
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + " "  + fields[1] + "%'" + " OR " + //[zao shang...]     //7
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + "1 " + fields[1] + "%'" + " OR " + //[zao1 shang...]    //8
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + "2 " + fields[1] + "%'" + " OR " + //[zao2 shang...]    //9
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + "3 " + fields[1] + "%'" + " OR " + //[zao3 shang...]    //10
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + "4 " + fields[1] + "%'" + " OR " + //[zao4 shang...]    //11
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'% " + fields[0] + "5 " + fields[1] + "%'" //[zao5 shang...]               //12
              );
    } else {
        query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_PINYIN + " LIKE " + "'%" + pattern + "%'"
              );
    }

    return query;
}

QSqlQuery CWD_DatabaseClass::searchByVietnamese(QString pattern)
{
    QSqlQuery query;

    query.exec("SELECT * FROM " + CWD_GlobalVariableClass::FTS_VIRTUAL_TABLE + " WHERE " +
                 CWD_GlobalVariableClass::COL_VIEMEAN + " LIKE " + "'%/" + pattern + "/%'" + " OR " +
                 CWD_GlobalVariableClass::COL_VIEMEAN + " LIKE " + "'%/" + pattern + " %'" + " OR " +
                 CWD_GlobalVariableClass::COL_VIEMEAN + " LIKE " + "'% " + pattern + "/%'" + " OR " +
                 CWD_GlobalVariableClass::COL_VIEMEAN + " LIKE " + "'% " + pattern + " %'"
              );

    return query;
}
