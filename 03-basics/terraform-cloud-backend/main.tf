terraform {
  backend "remote" {
    organization = "global-devops-academy"

    workspaces {
      name = "learning-terraform"
    }
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
