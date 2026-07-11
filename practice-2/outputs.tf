output "private_ips" {
  value = {
    for index, instance in aws_instance.web : var.ec2_names[index] => instance.private_ip
  }
}

output "route53_records" {
  value = {
    for index, record in aws_route53_record.web_route53 : var.ec2_names[index] => record.fqdn
  }
}
