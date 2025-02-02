import json
import boto3
import pandas as pd
import io

s3_client = boto3.client('s3')
glue_client = boto3.client('glue')

def lambda_handler(event, context):
    # Log the event
    print("Received event: " + json.dumps(event, indent=2))

    try:
        # Process the S3 event
        bucket_name = event['detail']['bucket']['name']
        object_key = event['detail']['object']['key']
        print(f"Processing S3 object: {object_key} in bucket: {bucket_name}")

        # Get the object from S3
        s3_response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        content = s3_response['Body'].read().decode('utf-8')
        print("contetn", content)
        # Read the CSV content using pandas
        csv_data = pd.read_csv(io.StringIO(content), index_col=False)
        column_names = list(csv_data.columns)
        print(column_names)
        print(csv_data)
        print(csv_data.shape)
        # Check if the CSV has 4 columns
        if len(csv_data.columns) == 5:
            print("CSV has 4 columns, triggering Glue job.")
            response = glue_client.start_job_run(JobName='glue-data-pipeline')
            print(f"Glue job started: {response['JobRunId']}")
        else:
            print("CSV does not have 4 columns.")

    except KeyError as e:
        print(f"KeyError: {e}")
        return {
            'statusCode': 400,
            'body': json.dumps(f"KeyError: {e}")
        }
    except Exception as e:
        print(f"Exception: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps(f"Exception: {e}")
        }

    return {
        'statusCode': 200,
        'body': json.dumps('Processing completed successfully')
    }