#!/bin/bash

#: Deploys scripts, public_html, and toolforge jobs.
#:
#: PRECONDITION:
#: 		1) webservice has been started.
#:
#: Author: Fastily

PUBLIC_HTML="public_html"
SCRIPTS="scripts"
PUBLIC_HTML_DIR=~/"${PUBLIC_HTML}"
SCRIPTS_DIR=~/"${SCRIPTS}"

set -e

## Copy public_html and scripts
echo "Deploying code..."
mkdir -p "${PUBLIC_HTML_DIR}/r" ~/logs

rsync -avhP "${PUBLIC_HTML}/" "$PUBLIC_HTML_DIR"
rsync -avhP "${SCRIPTS}/" "$SCRIPTS_DIR"
rsync -avhP "process_raw_reports.py" "run_report.sh" ~

## Load jobs
echo "Loading jobs..."
toolforge jobs flush
toolforge jobs load jobs.yaml

echo "Done!"