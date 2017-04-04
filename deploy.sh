#!/bin/bash

#: Deploys scripts, public_html, tool description, and crontab to web server.
#:
#: PRECONDITION:
#: 		1) Web server has been started.
#: Author: Fastily

publicHtmlDir="public_html"
scriptsDir="scripts"

rootPublicHtmlDir=~/"${publicHtmlDir}"
rootScriptsDir=~/"${scriptsDir}"

printf "Doing deploy\n"

## Copy public_html and scripts
printf "Copying public_html and scripts\n"
mkdir -p "${rootPublicHtmlDir}/r"
mkdir -p "${rootScriptsDir}"

cp -Rf "${publicHtmlDir}"/* "${rootPublicHtmlDir}"/
cp -Rf "${scriptsDir}"/* "${rootScriptsDir}"/

## Copy toollabs description
printf "Copying description\n"
cp -f .description ~/.description

## Load crontab
printf "Loading crontab\n"
crontab "crontab.txt"

printf "Done!\n"