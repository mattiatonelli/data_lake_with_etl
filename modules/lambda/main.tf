
data "archive_file" "data_pre_processor_lambda" {
  type        = "zip"
  source_dir  = "${path.module}/python"
  output_path = "${path.module}/python/lambda_function_payload.zip"
}

# Create a Lambda function to process incoming data files
resource "aws_lambda_function" "data_pre_processor" {
  filename         = data.archive_file.data_pre_processor_lambda.output_path
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_exec.arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(data.archive_file.data_pre_processor_lambda.output_path)
  timeout          = 900

  layers = [
    "arn:aws:lambda:eu-central-1:336392948345:layer:AWSSDKPandas-Python310:1"
  ]

  tags = {
    Name        = var.lambda_function_name
    Environment = var.environment
  }
}

# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_exec" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
