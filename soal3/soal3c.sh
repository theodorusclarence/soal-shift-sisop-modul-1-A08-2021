#!/bin/bash
i=1

kucCount=`ls | grep -E 'Kucing_*' | wc -l`
kelCount=`ls | grep -E 'Kelinci_*' | wc -l`

if [ $kucCount -ge $kelCount ]
then
    eng="bunny"
    ind="Kelinci"
else
    eng="kitten"
    ind="Kucing"
fi


# * Downloads file, but if the same file name exist, then don't
while [ $i -lt 24 ]
do
    wget --content-disposition https://loremflickr.com/320/240/$eng -a 'Foto.log'
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


dirname=$ind"_$(date +%d-%m-%Y)"

mkdir $dirname
cp *.jpg $dirname
rm *.jpg
mv Foto.log $dirname