data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default-vpc" {
  default = true
}