resource "aws_vpc" "vpc_cloud" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.vpc_cloud.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.project_name}-subnet"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc_cloud.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "table" {
  vpc_id = aws_vpc.vpc_cloud.id

  tags = {
    Name = "${var.project_name}-rt"
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.table.id
}

resource "aws_security_group" "my_sg" {
  name   = "${var.project_name}-sg"
  vpc_id = aws_vpc.vpc_cloud.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.my_subnet.id

  vpc_security_group_ids = [aws_security_group.my_sg.id]

  key_name = "Terraform-key"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project_name}-ec2"
  }
}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "${var.project_name}-logs"

  depends_on = [aws_instance.my_ec2]

  tags = {
    Name = "${var.project_name}-bucket"
  }
}