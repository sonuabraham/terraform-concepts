

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0 "
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}


resource "aws_instance" "web1" {
  ami           = "ami-0cf70e1d861e1dfb8"
  instance_type = "t2.micro"

  tags = {
    Name = "TestTer1"
  }
}


