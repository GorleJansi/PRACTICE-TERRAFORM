variable "project" {
    type = string 
}
variable "env" {
    type = string
}
variable "igw" {
    type = string
}

variable "pub_cidr_block" {
    type = list
}

variable "priv_cidr_block" {
    type = list
}

variable "data_cidr_block" {
    type = list
}

variable "ispeering_needed" {
    description = "Whether to create the VPC peering connection"
    type        = bool
    default     = true
}