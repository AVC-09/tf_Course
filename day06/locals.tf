#Local Variables - Internal variables for reusability
locals {
  #Local variable for bucket name
  full_bucket_name = "${var.environment}-${var.bucket_name}-${random_string.suffix.result}"
  
  #Local variable for common tags
  common_tags = {
    Environment = var.environment
    Project     = "Terraform Demo"
    Owner       = "DevOps-Team"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper  = false
}