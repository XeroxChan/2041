#!/bin/dash

BACKNUM=0
while [ $BACKNUM -ge 0 ]
do
    if [ -f ".$1.${BACKNUM}" ]
    then    
        BACKNUM=$(( BACKNUM + 1 ))

    else
        cp --backup "$1" ".$1.${BACKNUM}"
        echo "Backup of '$1' saved as '.$1.${BACKNUM}'"
        break
    fi
done
