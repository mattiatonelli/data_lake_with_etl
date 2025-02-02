variable "glue_role_name" {
  description = "The name of the Glue job"
  type        = string
}

variable "glue_job_name" {
  description = "The name of the Glue job"
  type        = string
}

variable "bucket_name" {
  description = "The S3 bucket name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, staging, prod)"
  type        = string
}
