terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.67.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }
  }
  required_version = ">= 0.14.0"
}
