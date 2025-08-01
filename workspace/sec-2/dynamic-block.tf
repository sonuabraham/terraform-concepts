/*
variable "sg_ports" {
    type = list(string)
    default = ["80", "443"]
}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic-sg"
  description = "Dynamic security group"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator =  ports
    content {
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/24"]
      description = "Allow HTTP traffic"
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    iterator = ports
    content {
      from_port   = ports.value
      to_port     = ports.value
      protocol    = "tcp"
      cidr_blocks = ["10.5.0.0/17"]
      description = "test egress traffic"
    }
  }
}


/*
resource "aws_security_group" "non_dynamic_sg" {
  name        = "non-dynamic-sg"
  description = "Non-dynamic security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/16"]
    description = "Allow HTTP traffic"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/16"]
    description = "Allow all outbound traffic"
  }
}
*/