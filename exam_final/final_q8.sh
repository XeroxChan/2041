#! /bin/dash

numfiles=$#

for tempfile in "$@"
do
    i=1
    while [ $i -le $numfiles ]
    do
        if cmp -s $tempfile $i
        then
            :
        elif $tempfile < $numfiles
        then
            echo "ln -s $tempfile $numfiles"
        fi
        i=`expr $i + 1`
    done
done
