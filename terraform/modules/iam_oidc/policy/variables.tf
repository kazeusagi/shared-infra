variable "name" {
  type        = string
  description = "許可ポリシーの名前"
}

variable "target_role_name" {
  type        = string
  description = "許可ポリシーを追加する対象のIAMロールの名前"
}

variable "allowed_assume_roles" {
  type        = list(string)
  description = "AssumeRoleを許可するロールの一覧"
}
