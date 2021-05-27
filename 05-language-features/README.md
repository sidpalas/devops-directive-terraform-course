# Hashicorp Configuration Language Features

The official documentation is the best reference for these: https://www.terraform.io/docs/language/index.html

NOTE: ` ```py ` is used on code blocks to get highlighting since HCL isn't an allowable language. 

## Expressions

### Strings
```py
"foo" # literal string

"foo ${var.bar}" # template string
```

### Operators
```py
# Order of operations: 
!, - # (multiplication by -1)
*, /, % # (modulo)
+, - # (subtraction)
>, >=, <, <= # (comparison)
==, != # (equality)
&& # (AND)
|| # (OR)
```

### Conditionals

Ternary syntax can be used to conditionally set values based on other values.

```py
condition ? true_val : false_val

# For example
var.a != "" ? var.a : "default-a"
```

### Other expression types:
- For expressions
- Splat expressions
- Dynamic blocks
- Type constraints
- Version constraints

## Functions
```py
# Numeric
abs()
ceil()
floor()
log()
max()
parseint() # parse as integer
pow()
signum() # sign of number

# string
chomp() # remove newlines at end
format() # format number
formatlist()
indent()
join()
lower()
regex()
regexall()
replace()
split()
strrev() # reverse string
substr()
title()
trim()
trimprefix()
trimsuffix()
trimspace()
upper()
```
### Other function types:
- Colleciton
- Encoding
- Filesystem
- Date & Time
- Hash & Crypto
- IP Network
- Type Conversion

## Meta-arguments

Special arguments to control the behavior of resources and/or modules

### depends_on

Allows specifying dependencies which do not manifest directly through consumption of data from another resource. For example if the creation order of two resources matters, the latter can be specified to depend on the former.

### count

Allows for creation of multiple of a particular resource or module. This is most useful if each instance configuration is nearly identical.

`count.index` can be referenced for each resource.

`Count = 0` can also be used to prevent creation of a resource or modules. This is usually used in conjunction with conditional expression to selectively determine if the resource needs to be created.

### for_each

Also allows for multiple of a particular resource or module but allows for more control across the instances by iterating over a list.

```json
resource "some_resource" "example" {
  for_each = toset( ["foo", "bar", "baz"] )
  name     = each.key
}
```

This would create three copies of `some_resource` with the name set to `"foo"`, `"bar"`, and `"baz"` respectively

### lifecycle

Lifecycle meta-arguments control how Terraform treats particular resources.

#### create_before_destroy

Specifying `create_before_destroy = true` indicates that if the resource does need to be destroyed, Terraform should first provision its replacement before destroying the deprecated resource. This can be useful for things such as zero downtime deployments.

```json
resource "some_resource" "example" {
  # ...

  lifecycle {
    create_before_destroy = true
  }
}
```

#### ignore_changes

Sometimes an entity outside of terraform will automatically modify a resource (e.g. adding metadata, etc...). The `ignore_changes` argument allows you to ignore specific types of resource changes to prevent this from causing Terraform to attempt to revert those changes.

#### prevent_destroy

`prevent_destroy` provides an additional stopgap against accidentally destroying resources with terraform. If set to true, Terraform will reject any attempt to destroy that resource.