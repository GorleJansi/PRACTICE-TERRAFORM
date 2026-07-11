resource "aws_instace" learn2-ec2 {
    count= length(var.ec2-names)
    ami = var.ami
    instance_type = var.instance_type
    tags {
        Name = ec2-names[count.index]
        env = dev
    }
}