resource "aws_instance" "for_ec2" {
    for_each = var.ec2_names
    instance_type = each.value
    ami = var.ami
    vpc_security_group_ids = [var.security_group_id]
    tags =  {  
       Name = each.key
       env = test
    }

}

resource "aws_rout53_record" "for_record" {
   for_each = aws_instance.for_ec2
    zoneid = var.hosted_zone_id
    name = "${each.key}.${var.domain}"
    type = 'A'
    ttl = 1
    records = [each.value.private_ip]

}