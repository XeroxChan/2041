#! /bin/dash
sort | cut -d'|' -f 3 | cut -d, -f 2 | sort | cut -d' ' -f 2 | uniq -c | sort -r | sed -E 's/^[ \t]*//' | cut -d ' ' -f 2 |head -1

