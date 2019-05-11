-- HiveSQL script for creating Hive db and tables for storing data

CREATE DATABASE IF NOT EXISTS ${env:LAB_HIVE_DB_NAME};

DROP TABLE IF EXISTS ${env:LAB_HIVE_TSV_TABLE_NAME};

-- Create table from TSV file

CREATE EXTERNAL TABLE ${env:LAB_HIVE_TSV_TABLE_NAME} (
        IsAdult INT,
        PostSize BIGINT,
        Crawled STRING,
        Country STRING,
        SubjectHtml STRING,
        Language STRING,
        Inserted STRING,
        Tags STRING,
        Type STRING,
        Published STRING,
        Url STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '${env:LAB_HIVE_TSV_EXPORT_PATH}';

