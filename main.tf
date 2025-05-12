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

# NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = module.subnets.public_subnet1_id # 퍼블릭 서브넷에 배치
}

# 프라이빗 라우팅 테이블
resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# 프라이빗 서브넷 연결
resource "aws_route_table_association" "private1" {
  subnet_id      = module.subnets.private_subnet1_id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = module.subnets.private_subnet2_id
  route_table_id = aws_route_table.private.id
}
