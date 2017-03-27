#!/bin/bash

#: Runs a MySQL query against the labs replica database and puts the result in ~/public_html/r.
#:
#:	Arguments:
#:		1) The integer id of the report to run.
#:
#: Author: Fastily

cd ~/scripts
reportFile=~/"public_html/r/report${1}.txt"

mysql --defaults-file=~/"replica.my.cnf" -h enwiki.labsdb enwiki_p -B < ~/"scripts/report${1}.sql" > "$reportFile"

## First two lines are junk
sed -i -e '1,3d' "$reportFile"
