output "public_subnet1_id" {
  value = module.subnets.public_subnet1_id
}

output "private_subnet1_id" {
  value = module.subnets.private_subnet1_id
}

output "private_subnet2_id" {
  value = module.subnets.private_subnet2_id
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
