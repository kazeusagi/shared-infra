# 信頼ポリシー
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [var.iam_oidc_provider_arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = var.allowed_repositories
    }
  }
}

# 各環境への権限ポリシー
data "aws_iam_policy_document" "allow_assume_target_roles" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = var.allowed_target_roles
  }
}
