/*
provider "aws" {
  region = "ap-southeast-2"
}


variable "user_tags" {
  type = map(string)
  default = {
    "Environment" = "Development"
    "Department"  = "Engineering"
  }
  
}

resource "aws_iam_user" "test-user" {
  name = "test-user-${count.index + 1}"
  tags = var.user_tags
  count = 3

}

output "tags_for_user" {
  value = aws_iam_user.test-user[*].arn
}
*/
