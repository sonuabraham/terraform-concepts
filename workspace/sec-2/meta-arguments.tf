/*
variable "ami_id" { 
  description = "The AMI ID to use for the instance"
  type        = string  
  default    = "ami-03af661583141dc27" # Example AMI ID, replace with a valid one for your region
  
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.micro"
}   
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TestSftpServer1"
  }

  
}

resource aws_s3_bucket "example" {
  bucket = "sftp-bucket-123456789qwwqq"
  
  tags = {
    Name        = "MyExampleBucket"
    Environment = "Dev"
  }
}

*/