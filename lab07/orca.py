#!/usr/bin/env python3

import sys
import re

orcaCount = 0


#loop through the args
for files in sys.argv[1:]:
    with open(files, 'r') as files:
        lines = files.readlines()
        for line in lines:
            #if found Orca
            if re.search(r'Orca', line):
                getNumber = line.split()
                orcaCount += int(getNumber[1])





print("{} Orcas reported".format(orcaCount))
