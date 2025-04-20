locals {
  allowed_sso_roles = [
    for row in split(",", data.aws_ssm_parameter.allowed_sso_roles.value) :
    trimspace(row) # 前後のスペースを削除
  ]

  allowed_assume_roles = [
    for row in split(",", data.aws_ssm_parameter.allowed_assume_roles.value) :
    trimspace(row) # 前後のスペースを削除
  ]
}
