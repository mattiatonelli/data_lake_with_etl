# Create an S3 bucket to store data files
resource "aws_s3_bucket" "data_bucket" {
  bucket = var.bucket_name
  tags = {
    Project     = var.resource_tag
    Environment = var.environment
  }
}

# Upload the Glue script to the S3 bucket
resource "aws_s3_object" "glue_script" {
  bucket = aws_s3_bucket.data_bucket.bucket
  key    = "scripts/glue_etl_script.py"
  source = "${path.module}/../glue/scripts/glue_etl_script.py"
  acl    = "private"
}

resource "aws_s3_object" "staging_area" {
  bucket = aws_s3_bucket.data_bucket.bucket
  key    = "1_staging/"
  source = "/dev/null"
  acl    = "private"
}
# Create an S3 bucket notification to trigger EventBridge on object creation
resource "aws_s3_bucket_notification" "data_bucket_notification" {
  bucket      = aws_s3_bucket.data_bucket.id
  eventbridge = true
}
