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

variable "allowed_target_roles" {
  type        = list(string)
  description = "許可するターゲットロールの一覧"
}
