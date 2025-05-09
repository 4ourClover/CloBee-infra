variable "vpc_id" {
  type = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "vpc_name" {
  type = string
}

variable "public_route_table_id" {
  type = string
}
