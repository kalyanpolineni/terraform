terraform {
  required_version = ">=1.7.4"
  backend "s3" {
    bucket = "kalyanpolineni"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

#Configure Provider Block
provider "aws" {}