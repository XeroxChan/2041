#! /bin/dash
sort -u -t'|' -k 2 | cut -d'|' -f 3 | cut -d, -f 2 | sort | cut -d ' ' -f 2

