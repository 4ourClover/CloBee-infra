output "public_subnet1_id" {
  value = module.subnets.public_subnet1_id
}

output "private_subnet1_id" {
  value = module.subnets.private_subnet1_id
}

output "private_subnet2_id" {
  value = module.subnets.private_subnet2_id
}

output "public_subnet2_id" {
  value = module.subnets.public_subnet2_id
}

output "private_subnet3_id" {
  value = module.subnets.private_subnet3_id
}

output "private_subnet4_id" {
  value = module.subnets.private_subnet4_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "app_fe_sg_id" {
  value = module.app-sg.app_fe_sg_id
}

output "app_sg_id" {
  value = module.app-sg.sg_id
}

output "iam_bastion_role_name" {
  value       = module.iam_bastion_role.role_name
  description = "IAM Role name for bastion"
}

output "iam_bastion_role_arn" {
  value       = module.iam_bastion_role.role_arn
  description = "IAM Role ARN for bastion"
}

output "iam_bastion_instance_profile_name" {
  value       = module.iam_bastion_role.instance_profile_name
  description = "Instance profile name for bastion"
}

output "iam_bastion_instance_profile_arn" {
  value       = module.iam_bastion_role.instance_profile_arn
  description = "Instance profile ARN for bastion"
}
