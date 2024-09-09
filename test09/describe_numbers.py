#!/usr/bin/env python3
import sys
import statistics
import math

numbers = []
uniqueNumbers=[]
for number in sys.argv[1:]:
    numbers.append(int(number))
    if number not in uniqueNumbers:
        uniqueNumbers.append(number)
        
        
print(f"count={len(numbers)}")
print(f"unique={len(uniqueNumbers)}")
print(f"minimum={min(numbers)}")
print(f"maximum={max(numbers)}")
print(f"mean={statistics.mean(numbers)}")
print(f"median={statistics.median(numbers)}")
print(f"mode={statistics.mode(numbers)}")
print(f"sum={sum(numbers)}")
print(f"product={math.prod(numbers)}")
