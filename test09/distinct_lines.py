#!/usr/bin/env python3

import sys
import re

targetLine = sys.argv[1]
targetLine = int(targetLine)
inputs = []
i=0

for lines in sys.stdin:
    i += 1
    lines = lines.lower()
    lines = "".join(lines.split())
    
    if lines not in inputs:
        inputs.append(lines)
    
    if len(inputs) == targetLine:
        print(f"{targetLine} distinct lines seen after {i} lines read.")
        sys.exit()


#when ctrl-D pressed before target lines read
if len(inputs) < targetLine:
    print(f"End of input reached after {i} lines read - {targetLine} different lines not seen.")
