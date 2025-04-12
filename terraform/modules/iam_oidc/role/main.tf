resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "assume_role" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# 各環境への権限ポリシーを付与
resource "aws_iam_policy" "this" {
  name   = "${var.name}_AllowAssumeTargetRolesPolicy"
  policy = data.aws_iam_policy_document.allow_assume_target_roles.json
}
resource "aws_iam_role_policy_attachment" "allow_assume_target_roles" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
