resource "aws_instance" "example" {
  ami           = "ami-0ff8a91507f77f867" # Amazon Linux 2023 AMI us-east-1
  instance_type = var.environment == "dev" ? "t2.micro" : "t3.micro"
  count         = var.instance_count

  tags = var.tags
}

resource "aws_security_group" "dynamic_sg" {
  name        = "sg"
  description = "Testing Dynamics"
  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress = []
}