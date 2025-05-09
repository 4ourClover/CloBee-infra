module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = "clobee-vpc"
  cidr_block = var.cidr_block
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  azs    = var.azs
}

module "alb" {
  source   = "./modules/alb"
  alb_name = "my-public-alb"
  subnets = [
    module.subnet.public_subnet1_id,
    module.subnet.public_subnet2_id
  ]
}
