/*
variable "user_names" {
  type    = set(string)
  default = ["alice", "bob", "charlie"]

}

resource "aws_iam_user" "users" {
  for_each = var.user_names

  name = each.value
}

variable "mymap" {
  type = map(string)
  default = {
    dev     = "ami-12324"
    prod    = "ami-5678"
    staging = "ami"
  }

  description = "A map of key-value pairs"
}

resource "aws_instance" "webserver" {
  for_each = var.mymap
  ami      = each.value

  instance_type = "t3.micro"

  tags = {
    Name = "TestSftpServer-${each.key}"
  }
}
*/