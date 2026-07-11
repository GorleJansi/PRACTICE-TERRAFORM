resource "aws_instance" "test1-EC2" {
    instance_type = var.instance_type
    ami = var.ami
    vpc_security_group_ids = [aws_security_group.test1-SG1.id]
    tags = {
        Name = "test1-terraform"
        env = "dev"
    }
}

resource "aws_instance" "test2-EC2" {
    instance_type = var.instance_type
    ami = var.ami
    vpc_security_group_ids = [aws_security_group.test1-SG1.id]
    tags = {
        Name = "test2-terraform"
        env = "test"
    }
}
resource "aws_security_group" "test1-SG1"{
    name = "SG1-terraform"
    ingress{
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "SG1-terraform"
    }
}