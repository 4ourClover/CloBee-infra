module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "clobee-vpc"
  cidr_block = var.cidr_block
}

module "ec2" {
  source   = "./modules/ec2"
  vpc_id   = module.vpc.vpc_id
  azs      = var.azs
  vpc_name = module.vpc.vpc_name
}

module "alb" {
  source   = "./modules/alb"
  alb_name = "my-public-alb"
  vpc_id   = module.vpc.vpc_id
  subnets = [module.ec2.public_subnet1]
}
