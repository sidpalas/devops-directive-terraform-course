terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "devops-directive-tf-state"
    key            = "05-organization-and-modules/web-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}

module "web_app_1" {
  source = "../web-app-module"

  # Input Variables
  bucket_name = "devops-directive-web-app-data"
  domain      = "mysuperawesomesite.com"
  db_name     = "mydb"
  db_user     = "foo"
  db_pass     = var.db_pass
}

module "web_app_2" {
  source = "../web-app-module"

  # Input Variables
  bucket_name = "devops-directive-web-app-data"
  domain      = "myothersuperawesomesite.com"
  db_name     = "mydb"
  db_user     = "foo"
  db_pass     = var.db_pass
}

