/*
resource "aws_instance" "my_instance" {      
    ami           = var.ami_id
    instance_type = var.list[0]
    vpc_security_group_ids = ["sg-0a89d3932026802bd"]

    tags = {
        Name = "TestInstance"
    } 
  
}


variable "list" {
  type    = list(string)
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
  type = map(string)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"
  }
}

*/