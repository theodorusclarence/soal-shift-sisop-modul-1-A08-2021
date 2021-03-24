#!/bin/bash

count=1
# a) Mengumpulkan jenis log (ERROR/INFO), pesan log, dan username
while IFS=$' ' read -r -a myArray
do
# echo "${myArray[@]:5:1}"
    for i in "${myArray[@]:5:1}";
    do
        if [[ "$i" -eq "ERROR"  ]];
        then
            echo "${myArray[@]}"
            echo $count;
            $((count++))
        fi
    done
unset 'myArray[${#myArray[@]}-1]'
# echo "${myArray[0]}, ${myArray[1]}, ${myArray[2]}, ${myArray[3]}, ${myArray[5]}"
#  echo "${myArray[@]:5}"
# echo "${myArray[${#myArray[@]}-2]}"
done < syslog.log
