terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.0"
             }
    }
    backend "s3" {
        bucket = "jansi-terraform-remotestate"
        key = "module-ec2"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}

provider "aws" {
    region = "us-east-1"
}