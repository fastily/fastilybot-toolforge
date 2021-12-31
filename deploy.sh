#!/bin/bash

#: Deploys scripts, public_html, tool description, and crontab.
#:
#: PRECONDITION:
#: 		1) webservice has been started.
#:
#: Author: Fastily

publicHtmlDir="public_html"
scriptsDir="scripts"

rootPublicHtmlDir=~/"${publicHtmlDir}"
rootScriptsDir=~/"${scriptsDir}"

printf "Doing deploy...\n"

## Copy public_html and scripts
printf "Copying public_html and scripts...\n"
mkdir -p "${rootPublicHtmlDir}/r" "$rootScriptsDir" ~/logs

cp -Rf "${publicHtmlDir}"/* "${rootPublicHtmlDir}/"
cp -Rf "${scriptsDir}"/* "${rootScriptsDir}/"

cp -f "process_raw_reports.py" "run_report.sh"  ~

## Load crontab
printf "Loading crontab...\n"
crontab "crontab.txt"

printf "Done!\n"