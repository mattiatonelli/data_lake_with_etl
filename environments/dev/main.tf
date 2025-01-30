module "s3" {
  source       = "../../modules/s3"
  bucket_name  = "${var.bucket_name}-dev"
  resource_tag = var.resource_tag
  environment  = "dev"
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "${var.function_name}-dev"
  handler       = var.handler
  runtime       = var.runtime
  role_name     = "${var.role_name}-dev"
  environment   = "dev"
}
