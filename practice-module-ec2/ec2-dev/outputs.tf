output "priv-ip" {
    value = module.test-ec2.test1-private_ip
}
output "pub_ip" {
    value = module.test-ec2.test1-private_ip
}

# In ec2-module/outputs.tf: expose values from the EC2 resoure
# In ec2-dev/outputs.tf: print the value coming from the module.