#!/bin/bash

#: Find files on the English Wikipedia which are tagged as both free and non-free.
#:
#: Author: Fastily

cd ~/scripts
source scriptUtils.sh

runMySQLReport freeAndNonFreeFiles licConflict