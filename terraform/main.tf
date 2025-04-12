# 共通で利用されるリソースを作成する

# OIDC
module "iam_oidc_provider" {
  source = "./modules/iam_oidc/provider"
}
module "iam_oidc_role" {
  source                = "./modules/iam_oidc/role"
  name                  = "GithubActionsOIDCRole"
  iam_oidc_provider_arn = module.iam_oidc_provider.arn
  allowed_repositories = [
    # Shared
    "repo:kazeusagi/shared-infra:ref:refs/heads/main",
    # Terraform AWS Template
    "repo:kazeusagi/terraform-aws-template:environment:prod",
    "repo:kazeusagi/terraform-aws-template:environment:dev",
  ]
  allowed_target_roles = [data.terraform_remote_state.terraform_aws_template_state]
}
