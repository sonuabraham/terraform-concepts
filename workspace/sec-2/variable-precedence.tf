/*
resource "aws_instance" "test-instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = ["sg-0a89d3932026802bd"]

    tags = {
        Name = "TestInstance"
    }
}

*/