terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "4640wk13"
    key = "terraform.tfstate"
    region = "us-west-2"
    encrypt = true
    use_lockfile = true
  }
}


provider "aws" {
  region = "us-west-2"
}

