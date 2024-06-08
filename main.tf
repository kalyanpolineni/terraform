terraform {
  required_version = ">=1.7.4"
  backend "s3" {
    bucket = "kalyanpolineni"
    key = "terraform.tfstate"
    region = "ap-south-1"  
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

#Configure Provider Block
provider "aws" {}

#Configure S3 Bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = "kalyanpolineni"
  tags = {
    Name        = "demobucket"
    description = "This bucket is created to store terraform statefile"
    Environment = "Dev"
  }
}