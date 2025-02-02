output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.data_pre_processor.arn
}

output "lambda_role_name" {
  description = "The name of the Lambda role"
  value       = aws_lambda_function.data_pre_processor.role
}

output "lambda_role_id" {
  description = "The ID of the Lambda execution role"
  value       = aws_iam_role.lambda_exec.id
}

output "lambda_role_arn" {
  description = "The arn of the Lambda execution role"
  value       = aws_iam_role.lambda_exec.arn
}
