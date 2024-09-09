#! /bin/bash

if [ $# != 2 ]
then
    echo "Usage: $0 <year> <course-prefix>"
elif ! [[ $1 =~ ^[0-9]+$ ]]
then
	echo "$0: argument 1 must be an integer between 2019 and 2022"
elif ((  $1 < 2019 || $1 > 2022 ))
then 
    echo "$0: argument 1 must be an integer between 2019 and 2022"
else
    echo |{
    url1=https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0
    
    curl -s -L $url1| 2041 jq '.contentlets | .[] | .code + " " + .title' | sed 's/"//g'
    
    url2=https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:$1%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:$2*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0
    
    
    curl -s -L $url2| 2041 jq '.contentlets | .[] | .code + " " + .title' | sed 's/"//g'
    }| sort | uniq
fi
