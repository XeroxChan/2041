import sys
import csv
import re

data = csv.reader(sys.stdin, delimiter='|')

total = 0

for course, stuid, name, progam, gender in csv.reader(sys.stdin, delimiter='|'):
    
    

    if re.search(r'3711', progam):
        total += 1

print(total)
