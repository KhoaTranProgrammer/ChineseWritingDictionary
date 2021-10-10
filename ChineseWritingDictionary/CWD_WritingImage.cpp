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
 * This file implements method to display QImage                              *
 *****************************************************************************/

/******************************************************************************
 * VERSION HISTORY                                                            *
 ******************************************************************************
 * [1.0.0]                                                                    *
 * Oct-10-2021: Initial version                                               *
 *              - Input from QImage                                           *
 *              - Drawing QImage into paint                                   *
 *****************************************************************************/

#include "CWD_WritingImage.h"

CWD_WritingImage::CWD_WritingImage(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    isImage = false;
}

void CWD_WritingImage::paint(QPainter *painter)
{
    if(isImage == true)
    {
        float scale = (this->width() / m_image.width()) < (this->height() / m_image.height()) ?
                    (this->width() / m_image.width()) : (this->height() / m_image.height());
        float startX, startY;
        startX = this->width() / 2 - (m_image.width() * scale) / 2;
        startY = this->height() / 2 - (m_image.height() * scale) / 2;
        QRectF r1(startX, startY, m_image.width() * scale, m_image.height() * scale);
        painter->drawImage(r1, m_image);
        emit drawingChanged();
    }
    else
    {
        QRectF r1(0, 0, this->width(), this->height());
        painter->fillRect(r1, QColor("transparent"));
    }
}

void CWD_WritingImage::setImage(const QImage &image)
{
    this->isImage = true;
    this->m_image = image;
    update();
}

void CWD_WritingImage::clearImage()
{
    this->isImage = false;
    update();
}
