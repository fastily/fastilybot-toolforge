#!/bin/bash

#: Find free files on the English Wikipedia which have no fileusage
#:
#: Author: Fastily

cd ~/scripts
source scriptUtils.sh

runMySQLReport orphanedFreeFiles orphanedFF