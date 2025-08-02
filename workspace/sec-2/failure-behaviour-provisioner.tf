resource "aws_iam_user" "test-user" {
  name = "test-user"

  tags = {
    Name = "test-user"
  }

  provisioner "local-exec" {
    command = "User ${self.name} created with ARN ${self.arn} > user_info.txt"
        on_failure = continue
  }

  provisioner "local-exec" {
    command = "aws iam create-login-profile --user-name ${self.name} --password 'Test@1234' --no-password-reset-required"

  }

  provisioner "local-exec" {
    when = destroy
    command = "echo User ${self.name} deleted > user_info.txt"
  }
  
}