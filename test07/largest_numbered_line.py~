#!/usr/bin/env python3

import sys
from sys import stdin
import re

LineNumberPair={}

for line in stdin:
    a = re.findall(r'[-+]?(?:\d*\.\d+|\d+)', line)
    if line not in LineNumberPair:
        LineNumberPair.update({line: a})

largest = -10000000000000000000000000
for string, value in LineNumberPair.items():
    if float(max(value)) > largest:
        largest = float(max(value))

for string, value in LineNumberPair.items():
    if float(max(value)) == largest:
        print(string, end="")
