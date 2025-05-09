resource "aws_instance" "this" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id[count.index]
  key_name               = var.key_name
  vpc_security_group_ids = [var.app_sg]

  tags = {
    Name = "${var.name_prefix}-${count.index}"
  }
}

