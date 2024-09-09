#! /bin/dash
sort -t '|' -k 2 | cut -d'|' -f 2| uniq -c| sed 's/^[ \t]*//'| grep -E '^2'| cut -d ' ' -f 2
