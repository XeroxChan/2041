#!/usr/bin/env python3
import re
import sys

lines = sys.stdin.readlines()

for line in lines:
    if re.match(r'#[0-9]+', line):
        replaceIndex = line.strip('#')
        print(lines[int(replaceIndex) - 1], end="")
    else:
        print(line, end="")
