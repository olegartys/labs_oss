-- HiveSQL script that loads data into Hive storage from HDFS

--LOAD DATA INPATH
--'${env:LAB_HIVE_HDFS_JSON_ARRAY_DATA_PATH}'
--OVERWRITE
--INTO TABLE `${env:LAB_HIVE_BLOGS_TABLE_NAME}`;

LOAD DATA INPATH
'${env:LAB_HIVE_HDFS_JSON_RAW_DATA_PATH}'
OVERWRITE
INTO TABLE `${env:LAB_HIVE_BLOGS_TABLE_NAME_RAW}`;
