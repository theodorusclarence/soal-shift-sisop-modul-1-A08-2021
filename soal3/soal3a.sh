#!/bin/bash

i=1

if [ ! -d "Kucing" ]
then
	mkdir Kucing
fi
cd Kucing

# * Downloads file, but if the same file name exist, then don't
while [ $i -lt 24 ]
do
	echo `wget -nc --content-disposition https://loremflickr.com/320/240/kitten -a 'Foto.log'`
	i=$((i + 1))
done

# * Rename .jpg files inside to incrementing name
i=1
find . -name "*.jpg" -print0 | while read -d $'\0' file
do
	mv $file Koleksi_$i.jpg
	i=$((i + 1))
done

