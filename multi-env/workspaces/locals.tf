locals {
  env = terraform.workspace

  tags = {
    project   = "${var.project}-${local.env}-workspace"
    terraform = "true"
    env       = local.env
  }
}
