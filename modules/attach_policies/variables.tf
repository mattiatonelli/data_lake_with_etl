variable "aws_account_id" {
  description = "The Account ID to use"
  type        = string
}

variable "bucket_name" {
  description = "The S3 bucket name"
  type        = string
}

variable "bucket_id" {
  description = "The S3 bucket id"
  type        = string
}

variable "bucket_arn" {
  description = "The S3 bucket arn"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda execution"
  type        = string
}

variable "lambda_role_id" {
  description = "The ID of the Lambda execution role"
  type        = string
}

variable "lambda_role_arn" {
  description = "The arn of the Lambda execution role"
  type        = string
}

variable "glue_job_arn" {
  description = "The arn of the Glue job"
  type        = string
}

variable "glue_role_name" {
  description = "The name of the IAM role for Glue"
  type        = string
}

variable "glue_job_name" {
  description = "The name of the Glue job"
  type        = string
}

variable "glue_role_id" {
  description = "The ID of the Glue IAM role"
  type        = string
}
