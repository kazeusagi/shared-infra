variable "name" {
  type        = string
  description = "IAMロールの名前"
}

variable "iam_oidc_provider_arn" {
  type        = string
  description = "OIDCプロバイダーのARN"
}

variable "repos" {
  type        = list(string)
  description = "許可するリポジトリの一覧"
}
