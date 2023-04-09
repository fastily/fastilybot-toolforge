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

echo "Doing deploy..."

## Copy public_html and scripts
echo "Copying public_html and scripts..."
mkdir -p "${rootPublicHtmlDir}/r" "$rootScriptsDir" ~/logs

cp -Rf "${publicHtmlDir}"/* "${rootPublicHtmlDir}/"
cp -Rf "${scriptsDir}"/* "${rootScriptsDir}/"

cp -f "process_raw_reports.py" "run_report.sh"  ~

## Load jobs
echo "Loading jobs..."
toolforge-jobs load jobs.yaml

echo "Done!"