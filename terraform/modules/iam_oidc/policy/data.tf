# 各環境のロールへのAssumeRoleを許可する許可ポリシー
data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.allowed_assume_roles
  }
}
