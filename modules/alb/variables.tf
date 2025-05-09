variable "vpc_id" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "subnets" {
  description = "List of subnets to associate with the ALB"
  type        = list(string)
}
