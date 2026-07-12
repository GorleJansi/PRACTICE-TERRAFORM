# Terraform Tfvars Runbook

Use this folder when you want to pass environment values with `-var-file`.

## Where to Run

Run from this directory:

```bash
cd /Users/jansigorle/Desktop/DEVOPS/Devops-Project/PROJECT-TERRAFORM/multi-env/tfvars
```

Do not run from `tfvars/dev` or `tfvars/prod` for the main EC2 configuration. Terraform loads only `.tf` files in the current directory, not child directories.

## Variable Files

Dev values:

```bash
dev/dev.tfvars
```

Prod values:

```bash
prod/prod.tfvars
```

Run dev plan:

```bash
terraform plan -var-file=dev/dev.tfvars
```

Run prod plan:

```bash
terraform plan -var-file=prod/prod.tfvars
```

Apply dev:

```bash
terraform apply -var-file=dev/dev.tfvars
```

Apply prod:

```bash
terraform apply -var-file=prod/prod.tfvars
```

## Backend Initialization

Backend configuration must be loaded from the same directory where you run Terraform.

Important: `tfvars/dev/provider.tf` and `tfvars/prod/provider.tf` are child-folder files. If you run from `tfvars`, Terraform will not load those backend blocks automatically.

Use one of these patterns:

## Pattern 1: One Root Backend

Keep `provider.tf` with the provider and backend block directly inside `tfvars`.

Example:

```hcl
terraform {
  backend "s3" {
    bucket       = "jansi-remotestate-dev"
    key          = "terraform-dev-remotestate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}
```

Then initialize:

```bash
terraform init
```

If backend values change:

```bash
terraform init -reconfigure
```

Then run with var files:

```bash
terraform validate
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars
```

## Pattern 2: Separate Backend Per Env

If dev and prod must use different S3 backend buckets or keys, keep one empty backend block in the root and pass backend values during init.

Root `tfvars/provider.tf` example:

```hcl
terraform {
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}
```

Example dev:

```bash
terraform init -reconfigure \
  -backend-config="bucket=jansi-remotestate-dev" \
  -backend-config="key=terraform-dev-remotestate" \
  -backend-config="region=us-east-1" \
  -backend-config="encrypt=true" \
  -backend-config="use_lockfile=true"

terraform plan -var-file=dev/dev.tfvars
```

Example prod:

```bash
terraform init -reconfigure \
  -backend-config="bucket=jansi-remotestate-prod" \
  -backend-config="key=terraform-prod-remotestate" \
  -backend-config="region=us-east-1" \
  -backend-config="encrypt=true" \
  -backend-config="use_lockfile=true"

terraform plan -var-file=prod/prod.tfvars
```

Before switching from dev backend to prod backend, always run `terraform init -reconfigure` with the correct backend values.

## Recommended Command Flow

Dev:

```bash
cd /Users/jansigorle/Desktop/DEVOPS/Devops-Project/PROJECT-TERRAFORM/multi-env/tfvars
terraform init
terraform validate
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars
```

Prod:

```bash
cd /Users/jansigorle/Desktop/DEVOPS/Devops-Project/PROJECT-TERRAFORM/multi-env/tfvars
terraform init -reconfigure
terraform validate
terraform plan -var-file=prod/prod.tfvars
terraform apply -var-file=prod/prod.tfvars
```

## Destroy

Destroy dev:

```bash
terraform destroy -var-file=dev/dev.tfvars
```

Destroy prod:

```bash
terraform destroy -var-file=prod/prod.tfvars
```
