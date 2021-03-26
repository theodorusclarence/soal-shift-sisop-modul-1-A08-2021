#!/bin/bash

# ! Correct
echo Error,Count >> error_message.csv
grep -oE '(ERROR) .* ' syslog.log | sed s/"ERROR "// | sort | uniq -c | while read count text
do 
    echo $text,$count >> error_message.csv
done
# grep -> get all line start from ERROR ......, but exclude the (), -o to print only the matching part
# sed -> Remove the "ERROR "
# sort | uniq -c -> count occurence with format `count text`
# while read count text -> to iterate
# then print with the following format to error_message.csv

# ! Correct
echo Username,INFO,ERROR >> user_statistic.csv
#* get INFO with the name, then only get string inside parentheses, sort|uniq to count occurence, then iterate
grep -oE '.* (INFO) .* (\(.*\))' syslog.log | sed  's/.*(\(.*\))/\1/' | sort | uniq -c | while read count name
do 
    # di grep, pake "" supaya bisa masuk variable, last sed buat apus whitespace
    errC=`grep -oE ".* (ERROR) .* (\($name\))" syslog.log | sed  's/.*(\(.*\))/\1/' | wc -l | sed 's/^[ \t]*//'`
    echo $name,$count,$errC >> user_statistic.csv
done 

# grep -> get INFO line
# sed -> get string inside parentheses
# sort | uniq -c -> count occurence with format `count text`
# iterate
    # grep -> get ERROR Line, with the same name
    # sed -> get string inside parentheses
    # wc -l -> count occurence 'nama' (no need to use uniq, because name is already stored)
    # sed -> remove whitespace in front of wc
    # print with following format

