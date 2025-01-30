output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.data_pre_processor.function_name
}
