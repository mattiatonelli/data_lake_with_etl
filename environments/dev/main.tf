module "s3" {

module "glue" {
  source         = "../../modules/glue"
  glue_role_name = var.glue_role_name
  glue_job_name  = var.glue_job_name
  bucket_name    = module.s3.bucket_name
  environment    = "dev"
}

module "lambda" {
  source               = "../../modules/lambda"
  lambda_function_name = var.lambda_function_name
  handler              = var.handler
  runtime              = var.runtime
  lambda_role_name     = var.lambda_role_name
  bucket_name          = var.bucket_name
  glue_job_arn         = module.glue.glue_job_arn
  environment          = "dev"
}

module "eventbridge" {
  source                 = "../../modules/eventbridge"
  event_bridge_rule_name = var.event_bridge_rule_name
  bucket_name            = var.bucket_name
  object_key             = var.object_key
  lambda_arn             = module.lambda.lambda_function_arn
  environment            = "dev"
}

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
