# Terraform Workspaces Runbook

Use this folder when you want one Terraform configuration and separate environments using `terraform workspace`.

## Where to Run

Run every command from this directory:

```bash
cd /Users/jansigorle/Desktop/DEVOPS/Devops-Project/PROJECT-TERRAFORM/multi-env/workspaces
```

Do not run workspace commands from `multi-env` root or from `tfvars`.

## Backend Initialization

This folder uses an S3 backend in `provider.tf`:

```hcl
backend "s3" {
  bucket       = "jansi-terraform-remotestate"
  key          = "terraform-workspace-remotestate"
  region       = "us-east-1"
  encrypt      = true
  use_lockfile = true
}
```

Initialize once before running plan/apply:

```bash
terraform init
```

If you change backend bucket, key, region, or lock setting later, run:

```bash
terraform init -reconfigure
```

You need AWS credentials and access to the S3 backend bucket before this can work.

## Run Dev

Create the workspace once:

```bash
terraform workspace new dev
```

If it already exists, select it:

```bash
terraform workspace select dev
```

Then run:

```bash
terraform validate
terraform plan
terraform apply
```

## Run Prod

Create the workspace once:

```bash
terraform workspace new prod
```

If it already exists, select it:

```bash
terraform workspace select prod
```

Then run:

```bash
terraform validate
terraform plan
terraform apply
```

## Check Current Workspace

```bash
terraform workspace show
terraform workspace list
```

## How Instance Type Is Selected

`variables.tf` contains a map:

```hcl
instance_type = {
  default = "t2.micro"
  dev     = "t2.micro"
  prod    = "t3.micro"
}
```

`main.tf` uses:

```hcl
instance_type = var.instance_type[local.env]
```

`local.env` comes from:

```hcl
env = terraform.workspace
```

So the selected workspace name decides the instance type.

## Destroy

Destroy only the selected workspace environment:

```bash
terraform workspace show
terraform destroy
```
