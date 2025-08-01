/*
resource "aws_instance" "web" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-06dc77ed59c310f03"]
  count = 3
  tags = {
    Name = "TestInstance-${count.index + 1}" 
     }
}

variable "users" {
  type = list(string)
  default = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "test-user" {   
    count = 2
    name = var.users[count.index]
    tags =  var.tags_map
}

*/