# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
  tags = {
    Name = "ec2_instance"
  }
  key_name = "terraform_key"
  ami                     = "ami-0e86e20dae9224db8"
  instance_type           = "t2.micro"
  subnet_id = "subnet-04353c1de9792fe4c"
}