# 共通で利用されるリソースを作成する

# OIDC
module "iam_oidc_provider" {
  source = "./modules/iam_oidc/provider"
}
module "iam_role" {
  source                = "./modules/iam_oidc/role"
  iam_oidc_provider_arn = module.iam_oidc_provider.arn
  repos = ["repo:kazeusagi/shared-infra:ref:refs/heads/main",
  "repo:kazeusagi/my-chatbot-infra:ref:refs/heads/main", ]
}
