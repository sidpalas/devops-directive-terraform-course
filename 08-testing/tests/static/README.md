# Static checks

## Built in

### Format
Enforces style rules for your configurations.
```
terraform fmt -check # checks if formatter would make chances

terraform fmt # applies those changes
```

### Validate
Checks that configuration are valid.

Terraform init is required to use validate. If not working with a remote backend, `terraform init -backend=false` can be used.
```
terraform validate
```

### Plan
Looking at the resulting Terraform plan can help catch bugs.
```
terraform plan
```

### Custom Validation Rules
Enforce conditions on variables to prevent misuse
```
variable "short_variable" {
  type = string

  validation {
    condition = length(var.short_variable) < 4
    error_message = "The short_variable value must be less than 4 characters!"
  }
}
```

## External

There are many 3rd party tools which can check Terraform configurations for potential issues and/or suggest best practices:
- [tflint](https://github.com/terraform-linters/tflint)
- [checkov](https://github.com/bridgecrewio/checkov)
- [terrascan](https://github.com/accurics/terrascan)
- [terraform-compliance](https://terraform-compliance.com/)
- [snyk](https://support.snyk.io/hc/en-us/articles/360010916577-Scan-and-fix-security-issues-in-your-Terraform-files)
- [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)
