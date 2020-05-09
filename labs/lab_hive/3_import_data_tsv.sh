#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${SCRIPT_DIR}/defs.sh

log "Running Hive create_tsv_table.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/create_tsv_table.sql

