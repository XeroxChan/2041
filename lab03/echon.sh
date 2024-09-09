#! /bin/bash

if [ $# != 2 ]
then
    echo "Usage: $0 <number of lines> <string>"
elif ! [[ $1 =~ ^[0-9]+$ ]]
then
    echo "$0: argument 1 must be a non-negative integer"
else
    i=0
    while [ $i -lt $1 ]
    do
        echo "$2"
        i=$(( i+1 ))
    done
fi

