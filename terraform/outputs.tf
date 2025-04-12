output "github_actions_oidc_role_arn" {
  value       = module.iam_oidc_role.role_arn
  description = "OIDCロールのARN"
}
