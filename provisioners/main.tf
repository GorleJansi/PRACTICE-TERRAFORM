resource "aws_instance" "pro-ec2"{
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids= ["sg-0708e7bc7b4f99963"]
    key_name = "jansi-test"
    tags = {
        Name = "provisioner-ec2"
    }
    provisioner "local-exec" {
        command = "echo ${aws_instance.pro-ec2.public_ip} >> inventory.ini"
    }
    provisioner "local-exec" {
        command = "echo destroyed the resource.......!!" 
        on_failure = continue
        when = destroy

    }
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl restart nginx"
        ]
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("/Users/jansigorle/jansi-test")
        host = self.public_ip
    }
}