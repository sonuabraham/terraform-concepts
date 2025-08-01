/*
resource "aws_iam_user" "user" {
  name = "tf-tf-user"
}


resource "aws_iam_user_policy" "user_policy" {
  name = "tf-tf-user-policy"
  user = aws_iam_user.user.name

  policy = file("./policy.json")
}

*/


