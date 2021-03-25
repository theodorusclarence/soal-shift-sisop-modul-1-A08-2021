#!/bin/bash

i=1
filename="Koleksi_"

folderName="duplicate"
if [ ! -d "$folderName" ]
then
	mkdir "$folderName"
fi

while [ $i -lt 24 ]
do
	kode="$(printf "%s%02d" $filename $i)"
	kucing="https://loremflickr.com/320/240/kitten"

	wget -O $kode $kucing -a "Foto.log"
	i=$((i + 1))

done

name1="Koleksi_"
name2="duplicate_"

grep 'Location' "Foto.log" >> "location.log"
i=1

while [ $i -lt 24 ]
do
	str1="$name1$i"
	cek1=$(cat location.log | head -$i | tail -1)
	j=1
	p=0
	limit=$(ls -1 | grep ^pdkt | wc -l)

	while [ $p -lt $limit ] 
	do
		if [ $i -ne $j ]
		then
			if [ -f "$name1$j" ]
			then
			cek2=$(cat location.log | head -$j | tail -1)
				if [ "$cek1" == "$cek2" ]
				then
				count=$(ls -1 ./duplicate | wc -l)
				count=$((count + 1))
				str2="$name2$count"
				mv $str1 $str2
				mv $str2 ./duplicate
				break
				fi
			fi
		fi
		j=$((j + 1))
		p=$((p + 1))
	done

	i=$((i + 1))
done

