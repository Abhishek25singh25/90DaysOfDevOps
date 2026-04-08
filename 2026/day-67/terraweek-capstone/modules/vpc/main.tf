resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.environment}-${var.project_name}-VPC"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr   
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.environment}-${var.project_name}-Public-Subnet"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"

  }

}

resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "${var.environment}-${var.project_name}-Internet gateway"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"


  }


}

resource "aws_route_table" "table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }
}

resource "aws_route_table_association" "assc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.table.id
}