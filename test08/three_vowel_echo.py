#!/usr/bin/env python3

import re
import sys

result=""
for word in sys.argv[1:]:
    pattern = r"[aeiouAEIOU]{3}"
    if re.findall(pattern, word):
        word += " "
        result += word

result = result.rstrip(" ")
print(result)
