#!/usr/bin/env python3

import sys
from sys import stdin

inp={}
value = sys.argv[1]
value = int(value)

for line in stdin:
    line = line.rstrip('\n')
    if line not in inp:
        inp.update({line: 1})
    elif line in inp:
        inp[line] = inp.get(line) + 1
    


for string, count in inp.items():
    if count == value:
        print(f"Snap: {string}")
