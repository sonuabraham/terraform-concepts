
resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = var.app_port
  ip_protocol       = "tcp"
  to_port           = var.app_port
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpc_cidr
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "101.20.30.50/32"
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "WebServer"
  }
}
