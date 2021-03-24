#!/bin/bash

# a) Mengumpulkan jenis log (ERROR/INFO), pesan log, dan username
while IFS=$' ' read -r -a myArray
do
unset 'myArray[${#myArray[@]}-1]'
# echo "${myArray[0]}, ${myArray[1]}, ${myArray[2]}, ${myArray[3]}, ${myArray[5]}"
 echo "${myArray[@]:5}"
# echo "${myArray[${#myArray[@]}-2]}"
done < syslog.log
