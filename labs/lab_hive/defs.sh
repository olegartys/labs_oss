#!/bin/bash

# Below variables are directly used by Hive scripts

# Database name: concatenation of username and "_watson" suffix
export LAB_HIVE_DB_NAME=${USER}_watson

# Table names: for raw JSON and JSON array examples
export LAB_HIVE_JSON_ARRAY_TABLE_NAME=${LAB_HIVE_DB_NAME}.blogs_data_json_arr
export LAB_HIVE_JSON_RAW_TABLE_NAME=${LAB_HIVE_DB_NAME}.blogs_data_json_raw

# Path in HDFS to load original data
export LAB_HIVE_HDFS_FILES_STORAGE_PATH=/user/${USER}/blogs_data

# Path for Hive storage where to load data
export LAB_HIVE_HDFS_DB_JSON_ARRAY_STORAGE_PATH=${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/db_json_arr
export LAB_HIVE_HDFS_DB_JSON_RAW_STORAGE_PATH=${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/db_json_raw

# Full path in HDFS to original data files
export LAB_HIVE_HDFS_JSON_ARRAY_DATA_PATH=${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/blogs-data-json-arr.txt
export LAB_HIVE_HDFS_JSON_RAW_DATA_PATH=${LAB_HIVE_HDFS_FILES_STORAGE_PATH}/blogs-data-json-raw.txt

# Where to export data in TSV format
# NOTE: must contain full URI formatted path
export LAB_HIVE_TSV_EXPORT_PATH='file://'${LABS_LABS_DIR}/lab_hive/tsv_dump

# Table with data imported from TSV file
export LAB_HIVE_TSV_TABLE_NAME=${LAB_HIVE_DB_NAME}.blogs_data_from_tsv;

# Where to export data in raw JSON format
# NOTE: must contain full URI formatted path
export LAB_HIVE_JSON_EXPORT_PATH='file://'${LABS_LABS_DIR}/lab_hive/json_raw_dump

# Brickhouse library needed for to_json UDF (user-defined function)
export LAB_HIVE_BRICKHOUSE_JAR_PATH=${LABS_JAR_LIBS_DIR}/brickhouse-0.8.2-JS.jar

