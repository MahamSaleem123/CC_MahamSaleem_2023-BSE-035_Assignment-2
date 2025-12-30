# Get your public IP
data "http" "my_ip" {
  url = "https://icanhazip.com"
}

locals {
  # Local reference for my_ip
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"
  # removes newline from the IP

  # Resource prefix for naming
  resource_prefix = "${var.project_name}-${var.environment}"

  # Common tags for all resources
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  # Backend servers configuration
  backend_servers = [
    {
      name        = "web-1"
      suffix      = "1"
      script_path = "./scripts/apache-setup.sh"
    },
    {
      name        = "web-2"
      suffix      = "2"
      script_path = "./scripts/apache-setup.sh"
    },
    {
      name        = "web-3"
      suffix      = "3"
      script_path = "./scripts/apache-setup.sh"
    }
  ]
}
