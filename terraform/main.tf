# 共通で利用されるリソースを作成する

# S3
module "s3" {
  source = "./modules/s3"
}

# OIDC idP
module "iam_oidc_provider" {
  source = "./modules/iam-oidc-provider"
}

module "iam_role" {
  source                = "./modules/iam_role"
  iam_oidc_provider_arn = module.iam_oidc_provider.arn
  repos                 = ["repo:kazeusagi/shared-infra:ref:refs/heads/main"]
}
