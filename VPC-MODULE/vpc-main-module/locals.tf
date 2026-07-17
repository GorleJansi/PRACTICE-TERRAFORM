locals {
  common_tags = {
    project   = var.project
    env       = var.env
    terraform = true
  }
  common_name = "${var.project}-${var.env}"
  az          = slice(data.aws_availability_zones.avail.names, 0, 2)
}
