output "roboshop-sg-id" {
  value       = aws_security_group.roboshop-sg.id
  description = "security group ID of roboshop-sg"
}
output "roboshop-sg-name" {
  value       = aws_security_group.roboshop-sg.name
  description = "security group name of roboshop-sg created"
}