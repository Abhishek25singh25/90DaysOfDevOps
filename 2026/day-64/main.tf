terraform {
  backend "s3" {
    bucket         = "terraweek-state-abhishek123"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraweek-state-lock"
    encrypt        = true
  }
}

resource "null_resource" "test" {}

resource "aws_s3_bucket" "logs_bucket" {
  bucket = "terraweek-import-test-abhishek1"
}
