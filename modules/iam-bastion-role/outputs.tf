output "instance_profile_name" {
  value = aws_iam_instance_profile.this.name
}

output "role_name" {
  value = aws_iam_role.this.name
}

output "role_arn" {
  description = "ARN of the IAM Role"
  value       = aws_iam_role.this.arn
}

output "instance_profile_arn" {
  description = "ARN of the IAM Instance Profile"
  value       = aws_iam_instance_profile.this.arn
}
