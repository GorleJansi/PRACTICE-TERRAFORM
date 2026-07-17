# VPC Module

This Terraform module creates a VPC setup for the `dev` environment.

## What It Creates

- VPC with CIDR `10.0.0.0/16`
- Internet Gateway
- 2 public subnets
- 2 private subnets
- Public route table
- Private route table
- Elastic IP
- NAT Gateway
- Public route to Internet Gateway
- Private route to NAT Gateway
- Route table associations for public and private subnets
- VPC peering connection with the default VPC
- Routes for VPC peering traffic

## Inputs

Default values are in `environment/dev/variables.tf`.

- `project-m`: project name, default `roboshop`
- `env-m`: environment name, default `dev`
- `pub_cidr-m`: public subnet CIDR list
- `priv_cidr-m`: private subnet CIDR list

## Outputs

- `vpc-id-m`
- `pub-sub-ids-m`
- `priv-sub-ids-m`

## How To Run

Run Terraform from the environment folder:

```bash
cd VPC-MODULE/environment/dev
terraform init
terraform validate
terraform plan
terraform apply
```

The backend is configured in `environment/dev/provider.tf`.
