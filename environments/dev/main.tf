module "s3" {
  source       = "../../modules/s3"
  bucket_name  = "${var.bucket_name}-dev"
  resource_tag = var.resource_tag
  environment  = "dev"
}

module "lambda" {
module "attach_policies" {
  source           = "../../modules/attach_policies"
  aws_account_id   = var.aws_account_id
  bucket_name      = var.bucket_name
  bucket_id        = module.s3.bucket_id
  bucket_arn       = module.s3.bucket_arn
  lambda_role_id   = module.lambda.lambda_role_id
  lambda_role_name = module.lambda.lambda_role_name
  lambda_role_arn  = module.lambda.lambda_role_arn
  glue_job_arn     = module.glue.glue_job_arn
  glue_job_name    = var.glue_job_name
  glue_role_name   = module.glue.glue_role_name
  glue_role_id     = module.glue.glue_role_id
}
