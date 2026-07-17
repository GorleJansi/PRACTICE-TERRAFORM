module "test-ec2" {
   source = "../ec2-module"

  ami           = var.ami
  instance_type = var.instance_type
  sg            = var.sg
  tags          = var.tags

}