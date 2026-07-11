resource "aws_instance" "learn1-ec2" {
   ami = "ami-01edba92f9036f76e"
   instance_type = "t2.micro"
   vpc_security_group_ids =["sg-071d5e944b8c4d93f"]
}