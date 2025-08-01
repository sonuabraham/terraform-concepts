/*
provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_instance" "tainted_instance" {
  ami           = "ami-078772dab3242ee11"
  instance_type = "t2.micro"

  tags = {
    Name = "TaintedInstance"
  }
}
*/