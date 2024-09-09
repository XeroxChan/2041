#! /bin/bash

small_file=""
medium_file=""
large_file=""

for file_name in *
do
	file_size=$(wc -l < "$file_name")

	if [ $file_size -lt 10 ]
	then 
		small_file+=" $file_name"
	elif [ $file_size -lt 100 ]
	then
		medium_file+=" $file_name"
	else
		large_file+=" $file_name"
	fi
done

echo "Small files:$small_file"
echo "Medium-sized files:$medium_file"
echo "Large files:$large_file"

