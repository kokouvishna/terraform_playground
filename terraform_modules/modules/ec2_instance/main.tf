
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  tags = {
    Name = "ec2_instance"
  }
  key_name = "terraform_key"
  ami                     = var.ami_value
  instance_type           = var.instance_type_value
  # subnet_id = "subnet-04353c1de9792fe4c"
}