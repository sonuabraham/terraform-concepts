/*
variable "tags"{
    type = map(string)
    default = {
        Team = "DevOps"
        Environment = "Development"
       
    }
}

locals {
  default = {
    CreateionDate = "date-${timestamp()}"
  }
}

resource "aws_security_group" "sec_1_sg" {
  name        = "sec-1-sg"
  description = "Security group for sec-1"
  tags =  local.default

}

resource "aws_security_group" "sec_2_sg" {
  name        = "sec-2-sg"
  description = "Security group for sec-2"
  tags =  local.default

}
*/

