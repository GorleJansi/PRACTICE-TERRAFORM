locals {
    comman_tags ={
        project = var.project
        env = var.env
        Terraform = true
    }
    az_name = slice(data.aws_availability_zones.available.names, 0, 2)
    comman_name ="${var.project}-${var.env}"
    comman_vpc_name = "${var.project}-${var.env}-VPC"
    comman_igw_name = "${var.project}-${var.env}-IGW"
    comman_subnet_name = "${var.project}-${var.env}-SUBNET"
    comman_RT_name = "${var.project}-${var.env}-RT"
}