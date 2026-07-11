
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" 
    }
  }
}

# 2. Configure the individual provider instances
provider "aws" {
  region = "us-east-1"     # which region to create resources in this  directory      
}



