resource "aws_instance" "test1-multi" {
  ami                    = var.ami
  instance_type          = var.instance_type[local.env]
  vpc_security_group_ids = [aws_security_group.sg-multi.id]
  tags                   = merge(local.tags, { Name = "${var.project}-${local.env}-EC2" })
}

resource "aws_security_group" "sg-multi" {
  vpc_id = var.vpc
  name   = "${var.project}-${local.env}-SG"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, { Name = "${var.project}-${local.env}-SG" })
}
