#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${SCRIPT_DIR}/defs.sh

log "Running Hive drop_db.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/drop_db.sql

