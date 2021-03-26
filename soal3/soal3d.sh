#!/bin/bash

cd soal-shift-sisop-modul-1-A08-2021/soal3

jam=`date +%H`

if [[ $jam -eq 7 ]]
then
    zip -r -e -P $(date +%m%d%Y) Koleksi.zip */
    # remove all zip
    rm -r */
elif [[ $jam -eq 18 ]]
then
    unzip -P $(date +%m%d%Y) Koleksi.zip
    rm Koleksi.zip
fi

