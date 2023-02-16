terraform {
  required_version = ">= 0.14.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.16.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.67.0"
    }
  }
}

provider "random" {
}

provider "postgresql" {
  host            = var.db_host
  port            = var.db_port
  database        = var.db_database_name
  username        = var.db_username
  password        = aws_secretsmanager_secret_version.this.secret_string
  sslmode         = var.db_sslmode
  connect_timeout = var.db_connect_timeout
  superuser       = var.db_superuser
}
