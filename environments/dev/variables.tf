# General
variable "aws_account_id" {
  description = "The Account ID to use"
  type        = string
}

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

# Glue
variable "glue_role_name" {
  description = "The name of the IAM role for Glue"
  type        = string
}

variable "glue_job_name" {
  description = "The name of the Glue job"
  type        = string
}

# Lambda
variable "lambda_function_name" {
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

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda execution"
  type        = string
}

# EventBridge
variable "event_bridge_rule_name" {
  description = "The name of the EventBridge rule"
  type        = string
}

variable "object_key" {
  description = "The key of the object to trigger the event"
  type        = string
}
