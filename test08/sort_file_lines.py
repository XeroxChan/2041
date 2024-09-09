#!/usr/bin/env python3

import sys
import re

with open(sys.argv[1], 'r') as files:
    lines = files.readlines()
    lines.sort()
    lines.sort(key=len)

for line in lines:
    print(line, end="")
