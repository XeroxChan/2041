#!/bin/dash



for file in "$@"
do
    while IFS= read -r line
    do
                         #quiet mode of grep
        if echo "$line" | grep -q "^\#include \""
        then
            #capture the result of sed
            filename=$(echo "$line" | sed -E 's/#include "(.*)"/\1/')
            
            #if file not found
            if ! [ -f "$filename" ]
            then
                echo "$filename included into $file does not exist"
            fi
        fi    
        
    done <$file
done
