# Python script for importing data into Hive from JSON array using Spark

import json
import sys
import os

from pyspark.sql import HiveContext
from pyspark import SparkContext

if len(sys.argv) != 3:
    print('Usage: %s json_file table_name' % sys.argv[0])
    sys.exit(-1)

# Context to interact with Hive storage

spark = SparkContext()
hiveContext = HiveContext(spark)

# Drop table if exists

hiveContext.sql('DROP TABLE IF EXISTS %s' % (sys.argv[2]))

# Read given JSON

jsonDF = hiveContext.read.json('file://' + sys.argv[1])

# Save parsed data in Hive storage

jsonDF.write.format('orc').saveAsTable(sys.argv[2])

