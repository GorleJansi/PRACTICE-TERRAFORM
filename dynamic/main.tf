resource "aws_security_group" "roboshop_sg" {
  name   = var.sg_name
  vpc_id = var.vpc

  dynamic "ingress" {
    for_each = toset(var.ports)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.sg_tags
}

resource "aws_instance" "local_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]
  tags                   = local.instance_tags
}
