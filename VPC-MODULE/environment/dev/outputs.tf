output "vpc-id-m" {
  value       = module.vpc1-m.vpc-id
  description = "vpc-id of created "
}

output "priv-sub-ids-m" {
  value       = module.vpc1-m.priv-sub-ids
  description = "private-subnet-ids of created "
}
output "pub-sub-ids-m" {
  value       = module.vpc1-m.pub-sub-ids
  description = "public-subnet-ids of created "
}