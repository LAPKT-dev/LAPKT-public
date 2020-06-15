#!/bin/bash
x=`find ./ -maxdepth 1 -type f -name 'tmp*'`
for i in $x
do
    rm $i
done

for pid in $(pidof -x $(basename $0)); do
    if [ $pid != $$ ]; then
        exit 0
    fi
done

x=`find /tmp/ -maxdepth 1 -type f -mmin +2 -name tmp*`
for i in $x
do
    rm $i
done

