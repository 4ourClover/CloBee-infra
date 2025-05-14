variable "role_name" {
  description = "IAM Role name for Bastion EC2"
  type        = string
}

variable "instance_profile_name" {
  description = "Instance profile name to attach to Bastion EC2"
  type        = string
}
