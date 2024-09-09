#!/usr/bin/env python3

import sys


result=""

wordList = []
for word in sys.argv[1:]:
    if word not in wordList:
        wordList.append(word)
        #word += " "
        #result += word
        print(word)

result = result.rstrip(' ')
print(result)
