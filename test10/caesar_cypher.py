#!/usr/bin/env python3

import sys

shift = sys.argv[1]

for line in sys.stdin:
    result = ""
    for char in line:
        if 65 <= ord(char) <= 90:
            temp = ord(char) + int(shift)
            while (temp < 65) or (temp > 90):
                if temp > 90:
                    temp -= 26
                elif temp < 65:
                    temp += 26
            
            result += chr(temp)
            continue
        elif 97 <= ord(char) <= 122:
            temp = ord(char) + int(shift)
            while (temp < 97) or (temp > 122):
                if temp > 122:
                    temp -= 26
                elif temp < 97:
                    temp += 26
            
            result += chr(temp)
            continue
        else:
            result += char
            continue
    print(result, end="")
