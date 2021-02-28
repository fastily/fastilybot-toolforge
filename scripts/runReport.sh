#!/bin/bash

#: Runs a MySQL query against the labs replica database and puts the result in ~/public_html/r.
#:
#:	Arguments:
#:		1) The integer id(s) of the report to run.
#:
#: Author: Fastily

if [ $# -lt 1 ]; then
	printf "Usage: runReport.sh <REPORT_NUMBERS...>\n"
	exit
fi

for i in "$@"; do
	reportFile=~/"public_html/r/report${i}.txt"
	mysql --defaults-file=~/"replica.my.cnf" -r -B -h enwiki.analytics.db.svc.eqiad.wmflabs enwiki_p < ~/"scripts/report${i}.sql" > "$reportFile"
	sed -i -e '1,3d' "$reportFile" 	# First two lines are junk
done