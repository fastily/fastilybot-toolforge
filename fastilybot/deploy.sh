#!/bin/bash

#: Deploys scripts and public_html files to live website.
#:
#: PRECONDITION:
#: 		1) public_html and exist in home directory.
#: Author: Fastily

PUBHTMLDIR="public_html"
SCRIPTSDIR="scripts"

printf "Doing deploy\n"

cp -Rf "${SCRIPTSDIR}"/* "${HOME}/${SCRIPTSDIR}"/
cp -Rf "${PUBHTMLDIR}"/* "${HOME}/${PUBHTMLDIR}"/

printf "Done!\n"