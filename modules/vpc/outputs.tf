output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_name" {
  value = var.vpc_name
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}
