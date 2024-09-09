#!/bin/dash

first=$1

while [ "$first" -le "$2" ]
do
    echo "$first" >> "$3"
    first=$(( first+1 ))
done
