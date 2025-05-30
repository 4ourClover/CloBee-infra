output "instance_profile_name" {
  description = "Name of the IAM Instance Profile for Fluentd node"
  value       = aws_iam_instance_profile.this.name
}

output "instance_profile_arn" {
  description = "ARN of the IAM Instance Profile"
  value       = aws_iam_instance_profile.this.arn
}

output "role_name" {
  description = "IAM Role name for Fluentd node"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.this.arn
}
