#! /bin/dash
    
start=$(echo $1 | tr -cd '[:[0-9]:]')
finish=$(echo $2 | tr -cd '[:digit:]')

i=$start
while [ $i -le $finish ]; do
    echo "$1" | sed -E "s/[[:digit:]]+/$i/g"
    i=$((i + 1))
done
