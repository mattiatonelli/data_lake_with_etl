import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Get job parameters
args = getResolvedOptions(sys.argv, ['JOB_NAME', 'SOURCE_S3_PATH', 'TARGET_S3_PATH'])

# Initialize Glue context and Spark context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Read the CSV file from S3
source_dynamic_frame = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": [args['SOURCE_S3_PATH']]},
    format="csv",
    format_options={"withHeader": True}
)

# Perform a simple transformation: add a new column 'year_of_birth'
transformed_dynamic_frame = source_dynamic_frame.map(lambda record: {
    **record,
    "year_of_birth": 2023 - int(record["age"]) if "age" in record and record["age"].isdigit() else None
})

# Write the transformed data back to S3 as CSV
glueContext.write_dynamic_frame.from_options(
    frame=transformed_dynamic_frame,
    connection_type="s3",
    connection_options={"path": args['TARGET_S3_PATH']},
    format="csv",
    format_options={"withHeader": True}
)

job.commit()