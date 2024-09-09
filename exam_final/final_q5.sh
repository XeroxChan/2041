#! /bin/dash



min=$(cat "$2" | grep -E "$1" | cut -d"|" -f2 | sort -n | head -n 1)
max=$(cat "$2" | grep -E "$1" | cut -d"|" -f2 | sort -n | tail -n 1)

sorted=$(cat "$2" | grep -E "$1" | cut -d'|' -f2 | sort)

n=$min

while [ $n -le $max ];
do
    if ! echo "$sorted" | grep -Eq $n
    then
        echo "$n"
        bool=1
    else
        :
    fi
    n=$(( n+1 ))
done

