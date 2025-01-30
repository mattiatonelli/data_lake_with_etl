# Create an S3 bucket to store data files
resource "aws_s3_bucket" "data_bucket" {
  bucket = var.bucket_name
  tags = {
    Project     = var.resource_tag
    Environment = var.environment
  }
}

# Create an S3 bucket notification to trigger EventBridge on object creation
resource "aws_s3_bucket_notification" "data_bucket_notification" {
  bucket      = aws_s3_bucket.data_bucket.id
  eventbridge = true
}
