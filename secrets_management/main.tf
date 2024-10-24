provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "54.236.254.17:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = ""
      secret_id = ""
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

# resource "aws_instance" "ec2_example" {
#   tags = {
#     Name = "ec2_instance"
#     Secret = data.vault_kv_secret_v2.example.data["foo"]
#   }
#   key_name = "terraform_key"
#   ami                     = "ami-0e86e20dae9224db8"
#   instance_type           = "t2.micro"
# }