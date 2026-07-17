resource "aws_instance" "test1-mod" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg
    tags = var.tags
}