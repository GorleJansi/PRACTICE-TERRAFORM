resource "aws_route53_record" "learn3-route53" {
   for_each = var.ec2_names
    zone_id = var.zone_id
    type = "A"
    ttl =1
    name = "${each.key}.${var.domain}"
    records = [each.key.private_ip]
}