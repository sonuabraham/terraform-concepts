/*
resource aws_iam_user "example" {
  name = "example-user"
}
resource aws_security_group "example" {
  name        = "example-security-group"
  description = "Example security group"
}

resource local_file "example" {
  filename = "${path.module}/example.txt"
  content  = "This is an example file."
}

resource aws_security_group "example2" {
  name        = "example-security-group-2"
  description = "Example security group 2"
}
*/

