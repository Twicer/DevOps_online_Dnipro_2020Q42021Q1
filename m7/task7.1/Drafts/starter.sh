awk -F " " '{ print $1}' example_log.log | uniq -c | sort -n
