module "vpc1-m" {
    source ="../terraform-module-vpc"

    project = var.project-m
    env = var.env-m
    igw = var.igw-m
    pub_cidr_block = var.pub_cidr_block-m
    priv_cidr_block = var.priv_cidr_block-m
    data_cidr_block = var.data_cidr_block-m
}