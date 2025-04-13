output "name" {
  value       = aws_iam_role.this.name
  description = "ロールの名前"
}

output "arn" {
  value       = aws_iam_role.this.arn
  description = "ロールのARN"
}
