# Subnet 1
resource "aws_subnet" "public-subnet1" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.10.0/24"
    availability_zone       = var.azs[0]
    map_public_ip_on_launch = true
    tags = { 
        Name = "${var.vpc_name}-public-subnet-1"
    }
}

resource "aws_subnet" "private-subnet1" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.20.0/24"
    availability_zone       = var.azs[0]
    map_public_ip_on_launch = false
    tags = { 
        Name = "${var.vpc_name}-private-subnet-1"
    }
}

# Subnet 2
resource "aws_subnet" "public-subnet2" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.11.0/24"
    availability_zone       = var.azs[1]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.vpc_name}-public-subnet-2"
    }
}

resource "aws_subnet" "public-subnet2" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.21.0/24"
    availability_zone       = var.azs[1]
    map_public_ip_on_launch = false
    tags = {
        Name = "${var.vpc_name}-public-subnet-2"
    }
}