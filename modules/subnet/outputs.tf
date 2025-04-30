output "internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
    value = aws_route_table.public.id
}

output "public_subnet1_id" {
    value = aws_subnet.public-subnet1.id
}

output "public_subnet2_id" {
    value = aws_subnet.public-subnet2.id
}