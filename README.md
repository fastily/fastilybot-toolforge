# fastilybot-toolforge
[![License: GPL v3](https://upload.wikimedia.org/wikipedia/commons/8/86/GPL_v3_Blue_Badge.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

Database reports used by [FastilyBot](https://en.wikipedia.org/wiki/User:FastilyBot) hosted on [WMF labs](https://tools.wmflabs.org/?list).

## Setup
Clone this repo in the target toolforge tool account, cd into the repo directory and run `bash deploy.sh` (script is idempotent, can be run as many time as you want)

## Raw comamnds
```bash
# weekly
toolforge jobs run fastily-reports-weekly --command "bash run_report.sh weekly" --filelog-stdout logs/weekly.txt --filelog-stderr logs/weekly.txt --mem 4Gi --cpu 1 --image mariadb
toolforge jobs run fastily-reports-weekly-python --command "bash run_report.sh weekly_python" --filelog-stdout logs/weekly.txt --filelog-stderr logs/weekly.txt --mem 4Gi --cpu 1 --image python3.11

# tri-weekly
toolforge jobs run fastily-reports-tri-weekly --command "bash run_report.sh tri_weekly" --filelog-stdout logs/tri_weekly.txt --filelog-stderr logs/tri_weekly.txt --mem 4Gi --cpu 1 --image mariadb

# daily
toolforge jobs run fastily-reports-daily --command "bash run_report.sh daily" --filelog-stdout logs/daily.txt --filelog-stderr logs/daily.txt --mem 4Gi --cpu 1 --image mariadb

# list jobs
toolforge jobs list --output long
```