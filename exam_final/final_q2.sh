grep -E "M$" | cut -d'|' -f3 | sort | uniq | cut -d',' -f1 | sort | uniq
