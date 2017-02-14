#!/bin/bash

#: Creates a report containing all en.wikipedia files with a duplicate on Commons.
#:
#: Author: Fastily

# cd "${0%/*}" &> /dev/null

OUTFOLDER="${HOME}/public_html/reports"
OUTFILE="${OUTFOLDER}/wpDupes.txt"

mkdir -p "$OUTFOLDER"

mysql --defaults-file="${HOME}"/replica.my.cnf -h enwiki.labsdb enwiki_p -B < findFilesOnWPandCOM.sql > "$OUTFILE"

## First two lines are junk
sed -i -e '1,3d' "$OUTFILE"