variable "vpc_cidr_block" { 
  description = "CIDR block for VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr_block))
    error_message = "Invalid VPC CIDR block"
  }
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr_block))
    error_message = "Invalid subnet CIDR block"
  }
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "env_prefix" {
  description = "Environment prefix"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  description = "Path to public SSH key"
  type        = string
}

variable "private_key" {
  description = "Path to private SSH key"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod/etc.)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

