variable "vpc_cidr" {   
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" 
    
}


variable "app_port" {
  description = "Port for the application"
  type        = number
  default     = 8080
}

variable "ssh_port" {
  description = "Port for SSH access"
  type        = number
  default     = 22
}

variable "ftp_port" {       
    description = "Port for FTP access"
    type        = number
    default     = 21
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
    default     = "ami-00543daa0ad4d3ea7"  # Default AMI, can be overridden in prod.tfvars or dev.tfvars
  
}

variable "instance_type" {  
    description = "Instance type for the EC2 instance"
    type        = string

}