resource "aws_instance" "web" {
  count = length(var.ec2_names)

  instance_type          = var.instance_type
  ami                    = var.ami
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.ec2_names[count.index]
  }
}

resource "aws_route53_record" "web_route53" {
  count = length(var.ec2_names)

  zone_id = var.hosted_zone_id
  name    = "${var.ec2_names[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.web[count.index].private_ip]
}
