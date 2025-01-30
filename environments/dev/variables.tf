# General
variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "resource_tag" {
  description = "Resource tag for identifying resources"
  type        = string
}

# S3
variable "bucket_name" {
  description = "The S3 bucket name"
  type        = string
}

# Lambda
variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The handler for the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime for the Lambda function"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role for Lambda execution"
  type        = string
}
