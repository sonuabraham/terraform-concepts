

/*
resource "aws_iam_user" "test-user" {   
    name = var.user_name
    tags = var.tags_map
    
}


resource "aws_instance" "web" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-06dc77ed59c310f03"]
}

output "tags_for_user" {
  value = aws_iam_user.test-user.tags
}
*/