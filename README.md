# IaC-Modules

This repository contains Infrastructure as Code (IaC) modules published by CloudExpertise.org.  
Currently this repository contains modules written for Terraform.

> ### Disclaimer  

> We publish these code here hoping someone can learn, improve or make use of these code snippets.  
> You are expected to have a moderate level of understanding to be able to use these code.
> There are no guarantee these code will work as you expect! Use and reference at your own risk!  
>  
> With that out of the way, have fun developing! 

## `aws` directory

This directory contains IaC Modules deployable into AWS environment.

`aws/<aws_resource_name>`
IaC Modules that provision group of resources to perform a function within AWS.  
See README.md within module for more information.

## Usage

See `README.md` under individual modules for usage example and variable attributes.

### General Example

```hcl
module "name" {
  source = "git@github.com:CloudExpertise-org/IaC-Modules.git//path/to/module?ref=version_name"

  # Define Required Input Variables
  required_variable_1  = "value_1"
  required_variable_2  = "value_2"

  # Define Optional Input Variables
  optional_variable_3  = "value_3"
  optional_variable_4  = "value_4"
}
```

### Note

Terraform module source must be version pinned to prevent unintentional or breaking changes from being introduced into live IaC environments.

This is achieved with Git Releases and `?ref=version_name` configuration in Terraform source.

See repository releases for more information on historical releases. 

Unless necessary, the latest release version name should always be used when calling the module for the first time. 

> version_name in production use must always reference a point-in-time release version (e.g., v1.0.0).  
> For development use, version_name can be substituted with a branch name to test new commits pushed to a specific branch.