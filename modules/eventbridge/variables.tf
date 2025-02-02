variable "event_bridge_rule_name" {
  description = "The name of the EventBridge rule"
  type        = string
}

variable "object_key" {
  description = "The key of the object to trigger the event"
  type        = string
}

variable "bucket_name" {
  description = "The S3 bucket name"
  type        = string
}

variable "lambda_arn" {
  description = "The ARN of the Lambda function to trigger"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}
