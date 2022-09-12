#terraform {
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#    }
#  }
#}

#terraform {
#  backend "s3" {
#    bucket = "terra-sree"
#    key    = "raju/terraform.tfstate"
#    region = "us-west-2"
#  }
#}

provider "aws" {
  region     = "us-west-2"
#  access_key = var.aws_access_key
#  secret_key = var.aws_secret_key
}