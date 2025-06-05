variable "role_name" {
  description = "IAM Role name for Fluentd EC2 nodes"
  type        = string
}

variable "instance_profile_name" {
  description = "Instance profile name to attach to Fluentd EC2"
  type        = string
}
