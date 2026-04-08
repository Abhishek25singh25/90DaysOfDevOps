resource "aws_security_group" "sgp" {
  name        = "${var.project_name}-${var.environment}-SGP"
  description = "Security group for ingress and egress"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  egress  {
    description = "allow all egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]



  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-SGP"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }

}