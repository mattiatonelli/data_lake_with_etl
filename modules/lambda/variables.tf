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

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}
