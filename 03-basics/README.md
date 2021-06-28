## 03 - Basics

## Remote Backends

Remote backends enable storage of TF state in a remote, location to enable secure collaboration.

### Terraform Cloud

https://www.terraform.io/cloud

`./terraform-cloud-backend/main.tf`

### AWS S3 + Dynamo DB

Steps to initialize backend in AWS and manage it with Terraform:

1) Use config from `./aws-backend/` (init, plan, apply) to provision s3 bucket and dynamoDB table with local state
2) Uncomment the remote backend configuration
3) Reinitialize with `terraform init`:

```
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes 
```

Now the S3 bucket and dynamoDB table are mam and are able to be used as the state backend!

## Web-App

Generic web application architecture including:
- EC2 instances
- S3 bucket
- RDS instance
- Load balancer
- Route 53 DNS config

This example will be refined and improved in later modules.

## Architecture
![](./web-app/architecture.png)