#!/usr/bin/env python3

import sys
import linecache

line_num = int(sys.argv[1])
file_name = str(sys.argv[2])

with open(file_name , 'r') as fp:
    num_lines = sum(1 for line in fp)
    
    if (line_num <= num_lines):
       line = linecache.getline(file_name, line_num)
       line = line.rstrip()
       print(line)
       
        
    
