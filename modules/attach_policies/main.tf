# Lambda
resource "aws_iam_role_policy" "lambda_s3_policy" {
  name = "lambda_s3_policy"
  role = var.lambda_role_id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_glue_policy" {
  name = "lambda_glue_policy"
  role = var.lambda_role_id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "glue:StartJobRun",
          "glue:GetJobRun",
          "glue:GetJobRuns",
          "glue:GetJob",
          "glue:GetJobs"
        ],
        Resource = var.glue_job_arn
      }
    ]
  })
}

# Attach the AWSLambdaBasicExecutionRole policy to the Lambda IAM role
resource "aws_iam_role_policy_attachment" "lambda_exec_policy" {
  role       = var.lambda_role_id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ----------------------------------------------------------------------------------------------------------

# Glue

# Attach the necessary policies to the Glue IAM role
resource "aws_iam_role_policy_attachment" "glue_service_policy" {
  role       = var.glue_role_id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy_attachment" "glue_s3_policy" {
  role       = var.glue_role_id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# ----------------------------------------------------------------------------------------------------------

# S3

# S3 permission policy for lambda and glue
resource "aws_s3_bucket_policy" "data_bucket_policy" {
  bucket = var.bucket_id

  policy = jsonencode({
    Version = "2012-10-17",
    Id      = "Policy",
    Statement = [
      {
        Sid    = "Allow-Glue-Role-Access",
        Effect = "Allow",
        Principal = {
          AWS = var.glue_role_name
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        Resource = [
          var.bucket_arn,
          "${var.bucket_arn}/*",
        ]
      },
      {
        Sid    = "Allow-Lambda-Access",
        Effect = "Allow",
        Principal = {
          AWS = var.lambda_role_name
        },
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          var.bucket_arn,
          "${var.bucket_arn}/*",
        ]
      }
    ]
  })
}
