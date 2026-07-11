resource "aws_instance" "learn3-ec2" {
    for_each = var.ec2_names
    ami = var.ami
    vpc_security_group_ids =[var.sg-id]
    instance_type = each.value
    tags = {
        Name      = each.key
        env       = "dev"
        project   = "roboshop"
        component = each.key
  }
    }
