#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${SCRIPT_DIR}/defs.sh

log "Clear old TSV data"
rm -rf ${LAB_HIVE_TSV_EXPORT_PATH}

log "Running Hive export_tsv.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/export_as_tsv.sql

