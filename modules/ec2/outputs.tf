output "public_ips" {
  value = aws_instance.this[*].public_ip
}

output "private_ips" {
  value = aws_instance.this[*].private_ip
}

output "app_sg" {
  value = aws_security_group.app_sg.id
}
