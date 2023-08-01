#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

scalp_pid=$(/bin/ps -aux | /bin/grep scalp.spot | /bin/grep -v grep | /bin/awk '{print $2}')
/bin/kill $scalp_pid

cd $SCRIPT_DIR/src
nohup python -m scalp.spot &
