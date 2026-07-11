resource "aws_instance" "pro-ec2"{
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids= ["sg-0708e7bc7b4f99963"]
    tags = {
        Name = "provisioner-ec2"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.pro-ec2.public_ip} >> inventory.ini"
    }
}