module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

module "subnets" {
  source                = "./modules/subnets"
  vpc_id                = module.vpc.vpc_id
  azs                   = var.azs
  vpc_name              = module.vpc.vpc_name
  public_route_table_id = module.vpc.public_route_table_id
}

module "alb" {
  source   = "./modules/alb"
  alb_name = "my-public-alb"
  vpc_id   = module.vpc.vpc_id
  subnets = [
    module.subnets.public_subnet1_id,
    module.subnets.public_subnet2_id
  ]
}

module "app-sg" {
  source    = "./modules/sg"
  vpc_id    = module.vpc.vpc_id
  sg_name   = "app-sg"
  alb_sg_id = module.alb.alb_sg_id
}

# module "ec2_master" {
#   source         = "./modules/ec2"
#   name_prefix    = "ec2_master"
#   instance_count = 1
#   ami            = var.ami
#   vpc_id         = module.vpc.vpc_id
#   instance_type  = var.instance_type_master
#   key_name       = var.key_name
#   subnet_id      = [module.subnets.private_subnet1_id]
#   alb_sg_id      = module.alb.alb_sg_id
#   app_sg         = module.app-sg.sg_id
# }

# module "ec2_worker" {
#   source         = "./modules/ec2"
#   name_prefix    = "ec2_worker"
#   instance_count = 2
#   vpc_id         = module.vpc.vpc_id
#   ami            = var.ami
#   instance_type  = var.instance_type_worker
#   key_name       = var.key_name
#   subnet_id = [
#     module.subnets.private_subnet2_id,
#     module.subnets.private_subnet3_id
#   ]
#   alb_sg_id = module.alb.alb_sg_id
#   app_sg    = module.app-sg.sg_id
# }

# module "ec2_fe" {
#   source         = "./modules/ec2"
#   name_prefix    = "ec2_fe"
#   instance_count = 1
#   vpc_id         = module.vpc.vpc_id
#   ami            = var.ami
#   instance_type  = var.instance_type_worker
#   key_name       = var.key_name
#   subnet_id = [module.subnets.public_subnet1_id]
#   alb_sg_id = module.alb.alb_sg_id
#   app_sg    = module.app-sg.app_fe_sg
# }