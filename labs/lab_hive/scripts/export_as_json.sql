-- Hive script that exports data from Hive table as a set of Json entries

ADD JAR ${env:LAB_HIVE_BRICKHOUSE_JAR_PATH};

CREATE TEMPORARY FUNCTION to_json AS 'brickhouse.udf.json.ToJsonUDF';

INSERT OVERWRITE LOCAL DIRECTORY '${env:LAB_HIVE_JSON_EXPORT_PATH}' 
ROW FORMAT DELIMITED
SELECT to_json(
	named_struct(
		'IsAdult', t.isadult,
		'PostSize', t.postsize,
		'Crawled', t.crawled,
		'Country', t.country,
		'SubjectHtml', t.subjecthtml,
		'Language', t.language,
		'Inserted', t.inserted,
		'Tags', t.tags,
		'Type', t.type,
		'Published', t.published,
		'Url', t.url
	)
) FROM ${env:LAB_HIVE_BLOGS_TABLE_NAME} as t; -- do not matter what the table of blogs_data_* is used

