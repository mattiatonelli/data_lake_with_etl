# Create an IAM role for EventBridge to invoke the Lambda function
resource "aws_iam_role" "eventbridge_invoke_lambda_role" {
  name = "eventbridge_invoke_lambda_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "events.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach policy to allow invoking the Lambda function
resource "aws_iam_role_policy" "eventbridge_invoke_lambda_policy" {
  name = "eventbridge_invoke_lambda_policy"
  role = aws_iam_role.eventbridge_invoke_lambda_role.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "lambda:InvokeFunction",
        Resource = var.lambda_arn
      }
    ]
  })
}

# Create an EventBridge rule to trigger on S3 object creation
resource "aws_cloudwatch_event_rule" "s3_data_processing_event_rule" {
  name        = var.event_bridge_rule_name
  description = "Trigger Lambda on S3 CSV upload"
  event_pattern = jsonencode({
    source      = ["aws.s3"]
    detail-type = ["Object Created"]
    detail = {
      bucket = {
        name = [var.bucket_name]
      }
      object = {
        key = [
          { suffix = var.object_key }
        ]
      }
    }
  })

  tags = {
    Name        = var.event_bridge_rule_name
    Environment = var.environment
  }
}

# Create an EventBridge target to trigger the Lambda function
resource "aws_cloudwatch_event_target" "lambda_target" {
  rule = aws_cloudwatch_event_rule.s3_data_processing_event_rule.name
  arn  = var.lambda_arn
}

# Add permission to the Lambda function to allow EventBridge to invoke it
resource "aws_lambda_permission" "allow_eventbridge_invoke" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_data_processing_event_rule.arn
}
