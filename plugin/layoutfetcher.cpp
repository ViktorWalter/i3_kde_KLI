/*
    Copyright (c) 2016 Carlos López Sánchez <musikolo{AT}hotmail[DOT]com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "layoutfetcher.h"

LayoutFetcher::LayoutFetcher(QObject *parent) : QObject(parent) {
    process = new QProcess();
}

LayoutFetcher::~LayoutFetcher() {
}

QString LayoutFetcher::getLayoutStr(){
    process->start("bash",QStringList() << "-c" << "xkblayout-state print \"%s\" | awk \'{printf \"%s\",toupper($1)}\'");
    process->waitForFinished();
    result = QString(process->readAllStandardOutput());
    
    return result;
}
