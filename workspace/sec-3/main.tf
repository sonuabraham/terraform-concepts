resource "aws_iam_user" "lb" {
  name = "demoiamuser"

  provisioner "local-exec" {
    command = " echo1 local-exec This is creation time provisioner"
    on_failure = continue
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo local-exec Destroying provisioner"
  
  }
}
/*
resource "aws_instance" "myec2" {
   ami = "ami-0cf70e1d861e1dfb8"
   instance_type = "t2.micro"
   key_name = "terraform-key"
   vpc_security_group_ids = ["sg-0348686b867bd0e5d"]

 connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key  = file("./terraform-key.pem")
    host     = self.public_ip
  }

 provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx",
    ]
  }
}

*/
/*
resource "aws_instance" "myec2" {
   ami = "ami-0cf70e1d861e1dfb8"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}
*/