/*
resource "aws_iam_user" "ads_user" {
  name = "ads-user"

  tags = {
    Name = "ads-user"
  }

  provisioner "local-exec" {
    command = "User ${self.name} created with ARN ${self.arn} > user_info.txt"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo User ${self.name} deleted > user_info.txt"
   
  }
  


}
*/