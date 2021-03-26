#!/bin/bash

# ! Correct
echo Error,Count >> error_message.csv
grep -oE '(ERROR) .* ' syslog.log | sed s/"ERROR "// | sort | uniq -c | while read count text
do 
    echo $text,$count >> error_message.csv
done
# ! Correct

# ! Correct
echo Username,INFO,ERROR >> user_statistic.csv
#* get INFO with the name, then only get string inside parentheses, sort|uniq to count occurence, then iterate
grep -oE '.* (INFO) .* (\(.*\))' syslog.log | sed  's/.*(\(.*\))/\1/' | sort | uniq -c | while read count text
do 
    # di grep, pake "" supaya bisa masuk variable, last sed buat apus whitespace
    errC=`grep -oE ".* (ERROR) .* (\($text\))" syslog.log | sed  's/.*(\(.*\))/\1/' | wc -l | sed 's/^[ \t]*//'`
    echo $text,$count,$errC >> user_statistic.csv
done 
# ! Correct