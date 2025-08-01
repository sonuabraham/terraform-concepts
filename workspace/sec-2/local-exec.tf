/*
provider "aws" {
  region = "ap-southeast-2"
}

# Get the VPC by tag name
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["DirectoryStack/VPC"]
  }
}

# Get all subnets in the VPC
data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  depends_on = [data.aws_vpc.selected]
}

# Create an EC2 instance in the first subnet
resource "aws_instance" "ad_custom_idp_instance" {
  ami           = "ami-093dc6859d9315726" # Replace with a valid AMI for your region
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnets.selected.ids[0]

  provisioner "local-exec" {
    command = "echo Instance ${self.id} created with AMI ${self.ami}, Public IP: ${self.public_ip}, Private IP: ${self.private_ip} > instance_info.txt"
  }

  tags = {
    Name = "ad-custom-idp-instance"
  }

  depends_on = [data.aws_subnets.selected]
}

# Optional: output instance info
output "instance_info" {
  value = {
    instance_id  = aws_instance.ad_custom_idp_instance.id
    public_ip    = aws_instance.ad_custom_idp_instance.public_ip
    private_ip   = aws_instance.ad_custom_idp_instance.private_ip
    subnet_id    = aws_instance.ad_custom_idp_instance.subnet_id
  }
}
*/