output "security_group_id" {
  value = aws_security_group.roboshop_sg.id
}

output "instance_id" {
  value = aws_instance.local_ec2.id
}
