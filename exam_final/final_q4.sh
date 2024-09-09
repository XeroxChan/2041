#! /bin/dash

filename=$1

min=$(sort -n $1 | head -n 1)
max=$(sort -n $1 | tail -n 1)

sorted=$(sort $1)

n=$min

while [ $n -le $max ];
do
    if ! echo "$sorted" | grep -Eq "$n" 
    then
        echo "$n"
    else
        :
    fi
    n=$(( n+1 ))
done


