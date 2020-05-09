-- HiveSQL script for creating Hive db and tables for storing data

CREATE DATABASE IF NOT EXISTS ${env:LAB_HIVE_DB_NAME};

-- DROP TABLE IF EXISTS ${env:LAB_HIVE_BLOGS_TABLE_NAME};
DROP TABLE IF EXISTS ${env:LAB_HIVE_BLOGS_TABLE_NAME_RAW};

-- NOTE: this code is kept for history. As for now
-- LAB_HIVE_BLOGS_TABLE_NAME is create from Spark script.

-- Create table from JSON Array

--CREATE EXTERNAL TABLE ${env:LAB_HIVE_BLOGS_TABLE_NAME} (
--	myarray ARRAY <STRUCT<
--		IsAdult:INT,
--		PostSize:BIGINT,
--		Crawled:STRING,
--		Country:STRING,
--		SubjectHtml:STRING,
--		Language:STRING,
--		Inserted:STRING,
--		Tags:STRING,
--		Type:STRING,
--		Published:STRING,
--		Url:STRING
--	>>
--)
--ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
--LOCATION '${env:LAB_HIVE_HDFS_DB_JSON_ARRAY_STORAGE_PATH}';

-- Create table from set of separate JSON entries

CREATE EXTERNAL TABLE ${env:LAB_HIVE_BLOGS_TABLE_NAME_RAW} (
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
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '${env:LAB_HIVE_HDFS_DB_JSON_RAW_STORAGE_PATH}';

