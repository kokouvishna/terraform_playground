provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  description = "value of the ami"
}
variable "instance_type" {
  description = "value of the instance type"
}

resource "aws_instance" "example" {
  tags = {
    Name = "ec2_instance"
  }
  key_name = "terraform_key"
  ami                     = var.ami
  instance_type           = var.instance_type
}