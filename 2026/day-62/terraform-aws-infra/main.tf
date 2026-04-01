resource "aws_vpc" "vpc_cloud" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TerraWeek-VPC"

  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.vpc_cloud.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc_cloud.id

  tags = {
    Name = "TerraWeek-IGW"
  }
}

resource "aws_route_table" "table" {
  vpc_id = aws_vpc.vpc_cloud.id

  tags = {
    Name = "TerraWeek-Route-Table"

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
    name="TerraWeek-SG"
    vpc_id = aws_vpc.vpc_cloud.id

    ingress  {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }

    ingress  {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraWeek-SG"

  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t3.micro"

  subnet_id = aws_subnet.my_subnet.id

  vpc_security_group_ids = [aws_security_group.my_sg.id]

  key_name = "Terraform-key"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "TerraWeek-EC2"
  }
}

resource "aws_s3_bucket" "logs_bucket" {
    bucket = "terraweek-log-bucket"

    depends_on = [ aws_instance.my_ec2 ]

    tags = {
        Name="Terraform-week-bucket"
    }
  
}