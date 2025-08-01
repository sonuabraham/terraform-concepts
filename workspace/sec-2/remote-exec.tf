provider "aws" {
  region = "ap-southeast-2"
}

# Get VPC
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
}

# Get Internet Gateway attached to VPC
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Get all route tables in the VPC
data "aws_route_tables" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

# Extract route table IDs
locals {
  all_route_table_ids = data.aws_route_tables.all.ids
}

# Get details for each route table
data "aws_route_table" "rt" {
  for_each       = toset(local.all_route_table_ids)
  route_table_id = each.value
}

# Identify public route tables (those routing to IGW)
locals {
  public_route_table_ids = [
    for rt_key, rt in data.aws_route_table.rt : rt.id
    if contains([for r in rt.routes : r.cidr_block], "0.0.0.0/0") &&
    contains([for r in rt.routes : r.gateway_id], data.aws_internet_gateway.default.id)
  ]
}

# Get subnet route table associations to find public subnets
data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.selected.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}

# Find public subnets by checking route table associations
locals {
  # Get all subnet associations for public route tables
  public_subnet_ids = flatten([
    for rt_key, rt in data.aws_route_table.rt : [
      for assoc in rt.associations : assoc.subnet_id
      if contains(local.public_route_table_ids, rt.id) && assoc.subnet_id != null
    ]
  ])

  # Use first available public subnet, fallback to first subnet if none found
  public_subnet_id = length(local.public_subnet_ids) > 0 ? local.public_subnet_ids[0] : data.aws_subnets.selected.ids[0]
}

# Create EC2 instance in public subnet
resource "aws_instance" "ad-manager-bastion" {
  ami                         = "ami-093dc6859d9315726"
  instance_type               = "t3.micro"
  subnet_id                   = local.public_subnet_id
  associate_public_ip_address = true
  key_name                    = "ad-bastion"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/mnt/c/sonu/devops/terraform/terraform-zeal/workspace/sec-2/ad-bastion.pem")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo Instance ${self.id} created with AMI ${self.ami}, Public IP: ${self.public_ip}, Private IP: ${self.private_ip} > instance_info.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Provisioning instance...'",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  tags = {
    Name = "ad-manager-bastion"
  }
}

# Outputs
output "instance_info" {
  value = {
    instance_id = aws_instance.ad-manager-bastion.id
    public_ip   = aws_instance.ad-manager-bastion.public_ip
    private_ip  = aws_instance.ad-manager-bastion.private_ip
    subnet_id   = aws_instance.ad-manager-bastion.subnet_id
  }
}

output "subnet_ids" {
  value = data.aws_subnets.selected.ids
}

output "public_route_tables" {
  value = local.public_route_table_ids
}

output "public_subnets" {
  value = local.public_subnet_ids
}
