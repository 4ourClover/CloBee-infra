module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "clobee-vpc"
  cidr_block = var.cidr_block
}

module "subnets" {
  source   = "./modules/subnets"
  vpc_id   = module.vpc.vpc_id
  azs      = var.azs
  vpc_name = module.vpc.vpc_name
}

module "alb" {
  source   = "./modules/alb"
  alb_name = "my-public-alb"
  vpc_id   = module.vpc.vpc_id
  subnets  = [module.ec2.public_subnet1_id]
}

module "ec2_master" {
  source         = "./modules/ec2"
  name_prefix    = "ec2_master"
  instance_count = 1
  ami            = var.ami
  instance_type  = var.instance_type
  key_name       = var.key_name
  subnet_id      = module.subnets.private_subnet1_id
  sg_id          = ""
}
