# public-subnet
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-1"
  }
}

# Subnet 1
resource "aws_subnet" "private-subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_name}-private-subnet-1"
  }
}

# Subnet 2
resource "aws_subnet" "private-subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_name}-private-subnet-2"
  }
}

# Subnet 3
resource "aws_subnet" "private-subnet3" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.13.0/24"
  availability_zone       = var.azs[0]
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.vpc_name}-private-subnet-3"
  }
}

# 라우트 테이블 - subnet 연결
resource "aws_route_table_association" "public_subnet1_assoc" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = var.public_route_table_id
}

# 지금은 사용 안하는 가용영역
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.20.0/24"
  availability_zone       = var.azs[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet-2"
  }
}

resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = var.public_route_table_id
}
