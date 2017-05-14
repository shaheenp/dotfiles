#!/bin/bash

COUNT=1
MAX=4

~/.fehbg > /dev/null 2>&1

while [ $? -ne 0 ];
do
    [ "$COUNT" -ge "$MAX" ] && notify-send "Did not run ~/.fehbg successfully" && exit 1
    ((COUNT++))
    sleep $COUNT
    ~/.fehbg > /dev/null 2>&1
done

