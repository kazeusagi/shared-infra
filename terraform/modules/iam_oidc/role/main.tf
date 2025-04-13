# カスタム信頼ポリシーを設定してロールを作成
# MEMO: カスタム信頼ポリシーはロールに直接定義されるため作成されない
resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# 作成したロールにs3への許可ポリシーを付与
resource "aws_iam_role_policy_attachment" "assume_role" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
