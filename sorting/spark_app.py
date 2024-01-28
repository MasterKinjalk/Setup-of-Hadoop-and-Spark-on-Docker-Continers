from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark = SparkSession.builder.appName("CapsSortingApp").getOrCreate()

# Read data from HDFS
df = spark.read.csv("hdfs://caps.csv", inferSchema=True, header=False).toDF("Year", "SerialNumber")

# Filter and sort the data
result = df.filter(df["Year"] <= 2023).orderBy("Year", "SerialNumber")

# Show the result (or write it back to HDFS or another storage)
result.show()

spark.stop()
