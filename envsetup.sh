#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "${DIR}" != "$(pwd)" ]]; then
    echo "Source script from the directory where it is placed!"
    return -1
fi

export CLOUDERA_ROOT_DIR=/opt/cloudera/parcels/CDH

export LABS_ROOT_DIR=$(pwd)
export LABS_LABS_DIR=${LABS_ROOT_DIR}/labs
export LABS_JAR_LIBS_DIR=${LABS_ROOT_DIR}/other

# Copy hive-hcatalog-core.jar into the Java libs dir

cp ${CLOUDERA_ROOT_DIR}/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core.jar ${LABS_JAR_LIBS_DIR}/

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
    local HCATALOG_CORE_JAR_PATH=${LABS_JAR_LIBS_DIR}/hive-hcatalog-core.jar
    local HIVE_RUN_SCRIPT_PATH=${CLOUDERA_ROOT_DIR}/bin/hive

    HIVE_AUX_JARS_PATH=$HCATALOG_CORE_JAR_PATH:$BRICKHOUSE_JAR_PATH:$HIVE_AUX_JARS_PATH $HIVE_RUN_SCRIPT_PATH $@
}
export -f run_hive

function hdfs_put_home()
{
    hdfs dfs -put $@ /user/${USER}
}
export -f hdfs_put_home

function hdfs_mkdir()
{
    hdfs dfs -mkdir $@
}
export -f hdfs_mkdir

# Check if directory for the current user exists in /user/${USER}.
# If not -- create it

hdfs dfs -test -d /user/${USER}
if [ $? != 0 ]; then
    log "HDFS working directory for ${USER} does not exist, creating it..."
    HADOOP_USER_NAME=hdfs hdfs_mkdir "/user/${USER}"
    HADOOP_USER_NAME=hdfs hdfs dfs -chown ${USER}:${USER} /user/${USER}
fi
