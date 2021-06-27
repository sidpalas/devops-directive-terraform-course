Steps to initialize backend in AWS and manage it with Terraform:

1) Use config from `bootstrap` (init, plan, apply) to provision s3 bucket and dynamoDB table with local state
2) Uncomment the remote backend configuration
```
  backend "s3" {
    bucket         = "devops-directive-tf-state"
    key            = "tf-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
```

1) Reinitialize with `terraform init`:

```
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "s3" backend. No existing state was found in the newly
  configured "s3" backend. Do you want to copy this state to the new "s3"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes 
```

Now the S3 bucket and dynamoDB table are managed by Terraform and are able to be used as the state backend!