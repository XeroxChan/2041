#!/usr/bin/env python3

import sys
import re 

with open(sys.argv[2], 'r') as files:
    regex_pattern = sys.argv[1]
    pattern = re.compile(regex_pattern)
    for line in files:
        if pattern.search(line):
            sys.stdout.write(line)
