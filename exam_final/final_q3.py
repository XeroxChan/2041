#!/usr/bin/env python3

import sys
import csv

data = csv.reader(sys.stdin, delimiter='|')

result=[]

for course, stuid, name, program, gender in csv.reader(sys.stdin, delimiter='|'):
    if gender == 'M':
        try:
            surname, firstname = name.split(',')
        except ValueError:
            continue
        
        if surname not in result:
            result.append(surname)

result.sort()
for ans in result:
    print(ans)
