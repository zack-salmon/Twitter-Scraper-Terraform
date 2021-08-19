terraform {
  backend "s3" {
    bucket         = "aws-serverless-twitter-event-source-terraform"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "twitter-event-source-terraform-state-locks"
  }
}

provider "aws" {
  region = var.aws_region
  version   = ">=3.46.0"
}
