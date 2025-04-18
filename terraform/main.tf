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
  allowed_repositories  = local.allowed_repositories
  allowed_sso_roles     = local.allowed_sso_roles
}

# 上記のロールに付与する許可ポリシー
# allowed_assume_rolesが空だと作成しない
module "iam_oidc_policy" {
  source               = "./modules/iam_oidc/policy"
  name                 = "GithubActionsOIDCRole_AllowAssumeRolesPolicy"
  target_role_name     = module.iam_oidc_role.name
  allowed_assume_roles = local.allowed_assume_roles
}
