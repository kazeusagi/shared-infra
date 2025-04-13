# 各環境のロールへのAssumeRoleを許可する許可ポリシーを作成して付与
# var.allowed_assume_rolesが空なら作成しない
resource "aws_iam_policy" "this" {
  count  = local.is_create
  name   = var.name
  policy = data.aws_iam_policy_document.this.json
}
resource "aws_iam_role_policy_attachment" "this" {
  count      = local.is_create
  role       = var.target_role_name
  policy_arn = aws_iam_policy.this[count.index].arn
}
