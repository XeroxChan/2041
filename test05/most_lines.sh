#! /bin/dash

maxFile=$1
for file in $@
do  
    numLines=$(wc -l $file|cut -d' ' -f 1)
    maxLine=$(wc -l $maxFile|cut -d' ' -f 1)

    if [ $numLines -gt $maxLine ]
    then
        maxFile=$file
        maxLine=$(wc -l $maxFile|cut -d' ' -f 1)
    fi
    
done

echo "$maxFile"

