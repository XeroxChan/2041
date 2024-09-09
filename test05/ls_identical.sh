#! /bin/dash

Dir1=$1
Dir2=$2
#loop through all files in directory 1
for file1 in $Dir1/*
do 
    #loop through all files in directory 2
    for file2 in $Dir2/*
    do
        #echo "$file1 $file2"
        #check if the name of the files are the same
        if [ "$(basename "$file1")" = "$(basename "$file2")" ]
        then
            #compare the two files using silent mode of cmp
            if cmp -s "$file1" "$file2"
            then
                echo "$(basename "$file1")"
            fi
        fi
    done
done
