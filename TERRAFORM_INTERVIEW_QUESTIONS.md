# Terraform Interview Questions

Use this file to practice for 2-year DevOps or Cloud Engineer roles. Answer each question out loud first, then write a short production-style answer.

## AI Interviewer Prompt

```text
Act like a Terraform interviewer for a 2-year DevOps/Cloud Engineer role.

Ask me one Terraform question at a time.
Wait for my answer before giving feedback.
Evaluate my answer like an interviewer:
- What is correct?
- What is missing?
- What should I say better in an interview?
- Give one strong sample answer.
- Ask one follow-up question.

Mix basic, intermediate, troubleshooting, and AWS scenario questions.
Focus on real project usage, not only definitions.
```

## Basic Terraform

1. What is Terraform, and why do teams use it?
2. What happens when you run `terraform init`?
3. What is the difference between `terraform plan` and `terraform apply`?
4. Why should you review a Terraform plan before applying it?
5. What does `terraform destroy` do, and when should you avoid using it?
6. What is a provider in Terraform?
7. Why do we use provider version constraints?
8. What is the purpose of `.terraform.lock.hcl`?
9. What is the difference between a resource and a data source?
10. What is an output in Terraform, and when is it useful?

## Variables, Locals, And Outputs

1. What is the difference between `variable`, `locals`, and `output`?
2. How do you pass variable values using a `.tfvars` file?
3. What is the difference between `terraform.tfvars` and `dev.tfvars`?
4. How do you pass a variable from the command line?
5. Why should secrets not be exposed through Terraform outputs?
6. What is the difference between `list`, `map`, and `object` variable types?
7. Give an example of a map of objects and explain where you would use it.
8. Why are variable defaults required to be static values?
9. How do you validate variable input in Terraform?
10. When would you use `locals` instead of variables?

## State And Backend

1. What is the Terraform state file?
2. Why is the state file important?
3. Why should Terraform state not be manually edited?
4. What is a remote backend?
5. Why do teams use an S3 backend for Terraform state?
6. What is state locking, and why is it important?
7. How does DynamoDB help with Terraform state locking?
8. What can happen if two engineers run `terraform apply` at the same time without locking?
9. What is the difference between local state and remote state?
10. How would you recover if the state file is accidentally deleted?

## Modules

1. What is a Terraform module?
2. Why do teams create reusable modules?
3. What is the difference between a root module and a child module?
4. How do you pass values from a root module into a child module?
5. How do you expose values from a child module?
6. What should you avoid hardcoding inside a reusable module?
7. How would you design a reusable VPC module?
8. How would you design a reusable EC2 module?
9. When should you not create a module?
10. How do you version Terraform modules in a team project?

## Count, For_each, And Dynamic Blocks

1. What is the difference between `count` and `for_each`?
2. When is `for_each` better than `count`?
3. Why can `count` cause resource replacement issues if a list order changes?
4. How do you access `each.key` and `each.value`?
5. How do you create multiple EC2 instances using `for_each`?
6. How do you create multiple security group rules using a map?
7. What is a dynamic block?
8. When should you use a dynamic block?
9. When can dynamic blocks make Terraform code harder to read?
10. How do you decide between separate resources and dynamic blocks?

## AWS Scenario Questions

1. Design a Terraform setup for a VPC with public and private subnets.
2. How would you create an EC2 instance with a security group using Terraform?
3. How would you allow SSH only from your IP address?
4. How would you create separate dev and prod environments?
5. How would you manage different instance types for dev and prod?
6. How would you store Terraform state in S3?
7. How would you prevent two people from applying Terraform at the same time?
8. How would you create Route 53 records using Terraform?
9. How would you request and validate an ACM certificate using Terraform?
10. How would you pass a VPC ID from one Terraform stack to another?

## Troubleshooting Questions

1. `terraform init` fails because the provider cannot be downloaded. What do you check?
2. `terraform plan` says a resource will be replaced. How do you investigate?
3. AWS says a security group ID is invalid or empty. What would you check in Terraform code?
4. Terraform says a variable value is not set. How do you fix it?
5. Terraform says a resource already exists. What options do you have?
6. Terraform state is locked. What do you check before using `force-unlock`?
7. Terraform plan shows unexpected changes. What could cause that?
8. A teammate changed infrastructure manually in AWS. How do you handle drift?
9. Terraform cannot find a module source. What do you check?
10. Terraform says an output does not exist. What files and module paths do you inspect?

## Interviewer Follow-up Questions

1. Explain one Terraform issue you debugged in a real or practice project.
2. How do you make Terraform code safe for a team?
3. How do you structure Terraform folders for multiple environments?
4. How do you review a Terraform pull request?
5. What files should be committed to Git and what files should be ignored?
6. Why should `.terraform/` not be committed?
7. Why should `.terraform.lock.hcl` usually be committed?
8. How do you reduce repeated code in Terraform?
9. How do you handle sensitive values in Terraform?
10. What Terraform topics are you still improving?

## Strong Answer Checklist

For each answer, try to include:

1. What the concept means.
2. Why it matters in real projects.
3. One Terraform command or code example.
4. One production risk or debugging point.
5. One AWS example if relevant.
