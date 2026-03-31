provider "aws" {
  region = "ap-south-1"
}

# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-bucket-josh-batch"
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"

  tags = {
    Name = "TerraWeek-Modified"
  }
}