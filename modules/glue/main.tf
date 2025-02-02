# Create an IAM role for Glue
resource "aws_iam_role" "glue_role" {
  name = var.glue_job_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "glue.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Create a Glue job for ETL operations
resource "aws_glue_job" "glue_etl_job" {
  name     = var.glue_role_name
  role_arn = aws_iam_role.glue_role.arn
  command {
    name            = "glue-etl"
    script_location = "s3://${var.bucket_name}/scripts/glue_etl_script.py"
    python_version  = "3.9"
  }

  default_arguments = {
    "--SOURCE_S3_PATH" = "s3://${var.bucket_name}/data_dump.csv"
    "--TARGET_S3_PATH" = "s3://${var.bucket_name}/2_silver/"
  }

  glue_version = "3.0"

  max_retries = 1

  tags = {
    Name        = var.glue_role_name
    Environment = var.environment
  }
}
