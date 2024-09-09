#!/usr/bin/env python3

import re
import sys

lines = sys.stdin.read()

print(re.sub('[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?', lambda x: str(round(float(x.group(0)))), lines), end="")
    
