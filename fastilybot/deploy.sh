#!/bin/bash

#: Deploys scripts and public_html files to live website.
#:
#: Author: Fastily

printf "Doing deploy\n"

PUBHTMLDIR="public_html"
SCRIPTSDIR="scripts"

cd ~
mkdir -p "$PUBHTMLDIR"
mkdir -p "$SCRIPTSDIR"

cd "${0%/*}" &> /dev/null
cp -Rf "${SCRIPTSDIR}"/* ~/"${SCRIPTSDIR}"/
cp -Rf "${PUBHTMLDIR}"/* ~/"${PUBHTMLDIR}"/

printf "Done!\n"