data "aws_ssm_parameter" "allowed_sso_roles" {
  name = "/shared/allowed_sso_roles"
}

data "aws_ssm_parameter" "allowed_assume_roles" {
  name = "/shared/allowed_assume_roles"
}
