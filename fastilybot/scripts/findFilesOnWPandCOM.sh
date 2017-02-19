#!/bin/bash

#: Creates a report containing all en.wikipedia files with a duplicate on Commons.
#:
#: Author: Fastily

cd ~/scripts
source scriptUtils.sh

runMySQLReport findFilesOnWPandCOM wpDupes