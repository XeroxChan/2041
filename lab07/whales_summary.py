#!/usr/bin/env python3

import re, sys
ind={}
pod={}
for files in sys.argv[1:]:
    with open(files, 'r') as files:
        lines = files.readlines()
        for line in lines:
	        line = line.lower()
	        line = re.sub(r'( )*s *$','',line)
	        line = re.sub(r' +',' ',line)
	        line = re.sub(r' $','',line)                                  
	        a = re.findall('(\d+) *(\d+) (.*)',line)
	        print(a)				
            if a[0][1] in ind:				    		
		        ind[a[0][1]] += int(a[0][0])				
		        pod[a[0][1]] += 1					
	        else:
		        ind[a[0][1]] = int(a[0][0])
		        pod[a[0][1]] = 1
		        
for key in sorted(ind):							
	p = str(pod[key])
	i = str(ind[key])
	print(key + " observations: " + p + " pods, "+ i +" individuals")
