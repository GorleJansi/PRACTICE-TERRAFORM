output "test1-private_ip" {
    value = aws_instance.test1-mod.private_ip
}

output "test1-public_ip" {
    value = aws_instance.test1-mod.public_ip
}