#!/usr/bin/env python3

import sys

source_file = open(sys.argv[1], "r")
destination_file = open(sys.argv[2], "w")

lines = source_file.readlines()

for lines in reversed(lines):
    destination_file.write(lines)
