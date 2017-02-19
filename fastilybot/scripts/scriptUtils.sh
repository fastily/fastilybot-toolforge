#!/bin/bash

#: Shared library functions for fastilybot scripts
#: 
#: Author: Fastily

##
# Runs a MySQL query against the labs replica database and puts the result in ~/public_html/reports.
#	Arguments:
#		1) The SQL file to run, without the .sql extension
#		2) The file to output results to, without the .txt extension
##
runMySQLReport()
{
	reportFile="${HOME}/public_html/reports/${2}.txt"

	mysql --defaults-file="${HOME}/replica.my.cnf" -h enwiki.labsdb enwiki_p -B < "${HOME}/scripts/${1}.sql" > "$reportFile"
	
	## First two lines are junk
	sed -i -e '1,3d' "$reportFile"
}