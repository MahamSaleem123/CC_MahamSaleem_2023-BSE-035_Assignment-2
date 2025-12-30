output "project_name" {
  description = "The name of the Terraform project"
  value       = var.project_name
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}

output "aws_region" {
  description = "AWS region used for deployment"
  value       = var.aws_region
}

output "resource_prefix" {
  description = "Prefix used for naming AWS resources"
  value       = local.resource_prefix
}

output "backend_public_ips" {
  description = "Public IPs of backend servers"
  value = {
    for k, m in module.backend_servers : k => m.public_ip
  }
}

# Networking Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.networking.subnet_id
}

# Nginx Server Outputs
output "nginx_public_ip" {
  description = "Nginx server public IP"
  value       = module.nginx_server.public_ip
}

output "nginx_instance_id" {
  description = "Nginx server instance ID"
  value       = module.nginx_server.instance_id
}

# Backend detailed info
output "backend_servers_info" {
  description = "Backend servers information"
  value = {
    for name, server in module.backend_servers :
    name => {
      instance_id = server.instance_id
      public_ip   = server.public_ip
      private_ip  = server.private_ip
    }
  }
}

# Configuration Guide (extra marks)
output "configuration_guide" {
  value = <<-EOT
========================================
DEPLOYMENT SUCCESSFUL
========================================
Nginx Public IP:
${module.nginx_server.public_ip}

Backend Private IPs:
- web-1: ${module.backend_servers["web-1"].private_ip}
- web-2: ${module.backend_servers["web-2"].private_ip}
- web-3: ${module.backend_servers["web-3"].private_ip}

Restart Nginx after updating backend IPs:
sudo systemctl restart nginx
========================================
EOT
}

