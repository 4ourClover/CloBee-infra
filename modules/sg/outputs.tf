output "sg_id" {
  value = aws_security_group.app_sg.id
}

output "app_fe_sg_id" {
  value = aws_security_group.app_fe_sg.id
}
