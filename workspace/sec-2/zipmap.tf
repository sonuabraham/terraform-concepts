/*
resource aws_iam_user "demo-user" {
  name = "demo-user-${count.index}"
  count = 3
  path = "/demo/"
}

output "user_names" {
  value = aws_iam_user.demo-user[*].name
}

output "arns" {
  value = aws_iam_user.demo-user[*].arn
}

output combined_output {
  value = zipmap(aws_iam_user.demo-user[*].name, aws_iam_user.demo-user[*].arn)
}
*/

