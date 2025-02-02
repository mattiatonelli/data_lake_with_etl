output "glue_job_arn" {
  description = "The arn of the Glue job"
  value       = aws_glue_job.glue_etl_job.arn
}
output "glue_role_name" {
  description = "The name of the Glue role"
  value       = aws_glue_job.glue_etl_job.role_arn
}

output "glue_role_id" {
  description = "The ID of the Glue IAM role"
  value       = aws_iam_role.glue_role.id
}
