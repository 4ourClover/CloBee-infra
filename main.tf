module "vpc" {
    source     = "./modules/vpc"
    vpc_name   = "clobee-vpc"
    cidr_block = var.cidr_block
}

module "ec2" {
    source     = "./modules/ec2"
    vpc_id     = module.vpc.vpc_id
    vpc_name   = var.vpc_name
    azs        = var.azs
}

module "alb" {
    source     = "./modules/alb"
    alb_name   = "my-public-alb"
    vpc_name   = var.vpc_name
    subnets           = [
        module.ec2.public_subnet1_id,
        module.ec2.public_subnet2_id
    ]
}
