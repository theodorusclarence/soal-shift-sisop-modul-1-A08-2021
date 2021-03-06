#!/bin/bash

cd `pwd`/soal-shift-sisop-modul-1-A08-2021/soal3

i=1

# * Downloads file, but if the same file name exist, then don't
while [ $i -lt 24 ]
do
	wget --content-disposition https://loremflickr.com/320/240/kitten -a 'Foto.log'
	i=$((i + 1))
done

# * remove duplicates
rm *.jpg.* 

# * Rename .jpg files inside to incrementing name
i=1
find . -name "*.jpg" ! -name "Koleksi*.jpg" -print0 | while read -d $'\0' file
do
	mv $file Koleksi_$i.jpg
	i=$((i + 1))
done


date="$(date +%d-%m-%Y)"

mkdir $date
cp *.jpg $date
rm *.jpg
mv Foto.log $date
