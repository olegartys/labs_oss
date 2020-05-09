#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${SCRIPT_DIR}/defs.sh

rm -rf ${SCRIPT_DIR}/json_raw_dump

log "Running Hive export_as_json.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/export_as_json.sql

