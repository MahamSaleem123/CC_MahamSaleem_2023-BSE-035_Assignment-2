variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix for naming resources"
  type        = string
}
