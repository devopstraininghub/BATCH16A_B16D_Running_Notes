terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.7.0"
    }
  }
}

provider "aws" {
  
  region = "us-east-1"
}


resource "aws_instance" "sbox" {

   # ami = "ami-084a7d336e816906b"
    ami  = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    key_name = "ramanikey"

    tags = {
      Name = "pre-prod"
    }
  
}
