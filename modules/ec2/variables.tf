variable "name_prefix" {
  description = "Prefix for instance names"
  type        = string
}

variable "instance_count" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "alb_sg_id" {
  description = "ID of the ALB security group"
  type        = string
}

variable "app_sg" {
  type = string
}
