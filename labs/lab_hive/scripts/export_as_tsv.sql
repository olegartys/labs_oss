INSERT OVERWRITE LOCAL DIRECTORY '${env:LAB_HIVE_TSV_EXPORT_PATH}' 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t' 
select * from ${env:LAB_HIVE_BLOGS_TABLE_NAME}; -- can be JSON_RAW_TABLE_NAME, do not matter

