#!/bin/bash

#: Runs a MySQL query against the labs replica database and puts the result in ~/public_html/r.
#:
#:	Arguments:
#:		1) The database to use (e.g. 'enwiki', 'commonswiki')
#:		2) The integer id(s) of the report to run.
#:
#: Author: Fastily

if [ $# -lt 2 ]; then
	printf "Usage: %s <DATABASE> <REPORT_NUMBERS...>\n" "${0##*/}"
	exit
fi

for f in ${@:2}; do
	printf -v report_file ~/"public_html/r/%s.txt" "$(basename "$f" .sql)"
	mysql --defaults-file=~/"replica.my.cnf" -q -r -B -h "${1}.analytics.db.svc.wikimedia.cloud" "${1}_p" < "$f" > "$report_file"
	sed -i -e "1,3d" "$report_file" # First two lines are junk
done

# -q - quick, don't buffer output
# -r - raw, don't escape things like backslashes
# -B - use tabs as column separators in output
# -h - hostname to use