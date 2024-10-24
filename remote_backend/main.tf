# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_example" {
  tags = {
    Name = "ec2_instance"
  }
  key_name = "terraform_key"
  ami                     = "ami-0e86e20dae9224db8"
  instance_type           = "t2.micro"
}

resource "aws_s3_bucket" "s3_example" {
  bucket = "kokougan-s3-demo-mak"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name             = "terraform-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}