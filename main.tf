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
