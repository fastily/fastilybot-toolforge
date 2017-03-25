#!/bin/bash

#: Deploys scripts and public_html files to live website.
#:
#: PRECONDITION:
#: 		1) public_html and exist in home directory.
#: Author: Fastily

publicHtmlDir="public_html"
scriptsDir="scripts"

rootPublicHtmlDir=~/"${publicHtmlDir}"
rootScriptsDir=~/"${scriptsDir}"

mkdir -p "${rootPublicHtmlDir}/r"
mkdir -p "${rootScriptsDir}"

printf "Doing deploy\n"

cp -Rf "${publicHtmlDir}"/* "${rootPublicHtmlDir}"/
cp -Rf "${scriptsDir}"/* "${rootScriptsDir}"/

printf "Done!\n"