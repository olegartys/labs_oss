#!/bin/bash

export CLOUDERA_ROOT_DIR=/opt/cloudera/parcels/CDH

export LABS_ROOT_DIR=$(pwd)
export LABS_LABS_DIR=${LABS_ROOT_DIR}/labs
export LABS_JAR_LIBS_DIR=${LABS_ROOT_DIR}/other

# Simple unified logger

function log()
{
    echo "[INFO]: $1"
}
export -f log

# Simple unified error logger

function log_error()
{
    echo "[ERROR]: $1"
}
export -f log_error

# Wrapper for Hive CLI script startup.
# It extends HIVE_AUX_JARS_PATH variable with necessary libraries (e.g. hive-hcatalog-core.jar)

function run_hive()
{
    local HCATALOG_CORE_JAR_PATH=${CLOUDERA_ROOT_DIR}/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar
    local HIVE_RUN_SCRIPT_PATH=${CLOUDERA_ROOT_DIR}/bin/hive

    HIVE_AUX_JARS_PATH=$HCATALOG_CORE_JAR_PATH:$BRICKHOUSE_JAR_PATH:$HIVE_AUX_JARS_PATH $HIVE_RUN_SCRIPT_PATH $@
}
export -f run_hive

