/*
data "local_file" "example" {
  filename = "${path.module}/example.txt"
}

data "aws_instance" "foo" {
  instance_id = "i-054f67e82d930c39b"


  filter {
    name   = "tag:Name"
    values = ["test-instance"]
  }

}

output "ec2_instance_id" {
  value = data.aws_instance.foo.subnet_id

}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

*/