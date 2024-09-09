#!/bin/dash

for f in *.htm
do
    if [ -e "${f%.htm}.html" ]
    then
        echo "${f%.htm}.html exists"
        exit 1
    fi
    mv -- "$f" "${f%.htm}.html"
done
