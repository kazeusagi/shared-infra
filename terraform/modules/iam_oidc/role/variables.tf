variable "name" {
  type        = string
  description = "IAMロールの名前"
}

variable "iam_oidc_provider_arn" {
  type        = string
  description = "OIDCプロバイダーのARN"
}

variable "allowed_repositories" {
  type        = list(string)
  description = "許可するリポジトリの一覧"
}

variable "allowed_sso_roles" {
  type        = list(string)
  description = "許可するSSOロールの一覧"
}
