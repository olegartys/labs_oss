#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Import variable definitions for this lab
source ${SCRIPT_DIR}/defs.sh

log "Create directories in HDFS for ${USER}"

hdfs dfs -mkdir ${LAB_HIVE_HDFS_FILES_STORAGE_PATH}
hdfs dfs -mkdir ${LAB_HIVE_HDFS_DB_JSON_ARRAY_STORAGE_PATH}
hdfs dfs -mkdir ${LAB_HIVE_HDFS_DB_JSON_RAW_STORAGE_PATH}

log "Upload blogs data into HDFS"

hdfs dfs -put -f ${LABS_ROOT_DIR}/data/IBMWatson/blogs-data-json-arr.txt ${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/blogs-data-json-arr.txt
hdfs dfs -put -f ${LABS_ROOT_DIR}/data/IBMWatson/blogs-data-json-raw.txt ${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/blogs-data-json-raw.txt

log "Running Hive create_tables.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/create_json_tables.sql

log "Running Hive load_data.sql..."
run_hive -f ${SCRIPT_DIR}/scripts/load_json_data.sql

log "Running pyspark script spark_data_upload.py"
${CLOUDERA_ROOT_DIR}/bin/spark-submit ${SCRIPT_DIR}/scripts/load_json_data_spark.py ${LABS_ROOT_DIR}/data/IBMWatson/blogs-data-json-arr.txt ${LAB_HIVE_JSON_ARRAY_TABLE_NAME}

