variable "aws_account_id" {
  description = "The Account ID to use"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}

variable "resource_tag" {
  description = "Resource tag for identifying resources"
  type        = string
}

variable "glue_role_name" {
  description = "The name of the IAM role for Glue"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda execution"
  type        = string
}
