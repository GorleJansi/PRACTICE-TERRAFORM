resource "aws_instance" "test1-multi" {
    ami = var.ami
    instance_type = var.instance_type[terraform.workspace]        # var.instance_type[local.env]
    vpc_security_group_ids = [aws_security_group.sg-multi.id]

}

resource "aws_security_group" "sg-multi" {
    vpc_id = var.vpc
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }    
}