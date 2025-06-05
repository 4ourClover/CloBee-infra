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

module "iam_bastion_role" {
  source                = "./modules/iam-bastion-role"
  role_name             = "kops-bastion-role"
  instance_profile_name = "kops-bastion-profile"
}

module "iam_fluentd_role" {
  source                = "./modules/iam-node-role"
  role_name             = "kops-fluentd-role"
  instance_profile_name = "kops-fluentd-profile"
}

# NAT Gateway
resource "aws_eip" "nat_eip_a" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id     = module.subnets.public_subnet1_id

  tags = {
    Name = "nat-gw-a"
  }
}

resource "aws_eip" "nat_eip_c" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_c" {
  allocation_id = aws_eip.nat_eip_c.id
  subnet_id     = module.subnets.public_subnet2_id

  tags = {
    Name = "nat-gw-b"
  }
}

# 프라이빗 라우팅 테이블 - AZ a
resource "aws_route_table" "private_rt_a" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_a.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt-a"
  }
}

resource "aws_route_table_association" "private_rt_assoc_a1" {
  subnet_id      = module.subnets.private_subnet1_id
  route_table_id = aws_route_table.private_rt_a.id
}

resource "aws_route_table_association" "private_rt_assoc_a2" {
  subnet_id      = module.subnets.private_subnet2_id
  route_table_id = aws_route_table.private_rt_a.id
}

# AZ c
resource "aws_route_table" "private_rt_c" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_c.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt-c"
  }
}

resource "aws_route_table_association" "private_rt_assoc_c1" {
  subnet_id      = module.subnets.private_subnet3_id
  route_table_id = aws_route_table.private_rt_c.id
}

resource "aws_route_table_association" "private_rt_assoc_c2" {
  subnet_id      = module.subnets.private_subnet4_id
  route_table_id = aws_route_table.private_rt_c.id
}

resource "aws_route_table_association" "private_rt_assoc_c3" {
  subnet_id      = module.subnets.private_subnet5_id
  route_table_id = aws_route_table.private_rt_c.id
}


