variable "aws_region" {
  default = "ap-northeast-2" # 서울
}

variable "azs" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "cidr_block" {
  type = string
}

variable "vpc_name" {
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
  type = string
}

variable "sg_id" {
  type = string
}
