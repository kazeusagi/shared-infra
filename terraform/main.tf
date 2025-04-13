# 共通で利用されるリソースを作成する

# OIDC
# IDプロバイダ
module "iam_oidc_provider" {
  source = "./modules/iam_oidc/provider"
}

# IDプロバイダに割り当てるロール
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
}

# 上記のロールに付与する許可ポリシー
# MEMO: 初回実行時はcount=0にして許可ポリシーを作成しないようにする
#       → allowed_assume_rolesが空だとエラーになるため
module "iam_oidc_policy" {
  source               = "./modules/iam_oidc/policy"
  name                 = "GithubActionsOIDCRole_AllowAssumeRolesPolicy"
  target_role_name     = module.iam_oidc_role.name
  allowed_assume_roles = []
}
