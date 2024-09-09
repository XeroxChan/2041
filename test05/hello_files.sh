#!/bin/dash

counter=1

while [ $counter -le $1 ]
do
    touch hello${counter}.txt
    echo "hello $2" > hello${counter}.txt
    counter=$(( counter+1 ))
done
