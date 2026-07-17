module "vpc1-m" {

  source = "../../vpc-main-module" # source = git::<url>

  env       = var.env-m
  pub_cidr  = var.pub_cidr-m
  priv_cidr = var.priv_cidr-m
  project   = var.project-m


}