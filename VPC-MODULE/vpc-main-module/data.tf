data "aws_availability_zones" "avail" {
  state = "available"
}
data "aws_vpc" "default" {
  default = true
}
