output "vpc-id" {
  value = aws_vpc.vpc1.id
}

output "priv-sub-ids" {
  value = aws_subnet.priv-subnet1[*].id
}
output "pub-sub-ids" {
  value = aws_subnet.pub-subnet1[*].id
}