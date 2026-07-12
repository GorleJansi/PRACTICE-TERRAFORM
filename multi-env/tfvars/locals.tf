locals {

  tags = {
    project   = "${var.project}-${var.env}-workspace"
    terraform = "true"
    env       = var.env
  }
}
