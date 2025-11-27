terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" #hello
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}