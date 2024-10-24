
terraform {
  backend "s3" {
    bucket = "kokougan-s3-demo-mak"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_lock"
  }
}

