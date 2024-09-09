#!/bin/dash

snapshot-save.sh

echo "Restoring snapshot $1"


for file in *
do 
    #ignore
    if  echo "$file" | grep -Eq "^\." 
    then
        :
    #ignore
    elif [ "$file" = "snapshot-save.sh" ] || [ "$file" = "snapshot-load.sh" ]
    then
        :
        
    else
        cp ".snapshot.$1/$file" "$file"
    fi
done
