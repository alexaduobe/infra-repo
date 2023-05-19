terraform {
  required_version = "1.4.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }

  backend "s3" {
    region         = "us-east-2"
    bucket         = "dl-aws-mgmt-tfstate-187402594320"
    key            = "pre-controltower/terraform.tfstate"
    dynamodb_table = "dl-aws-mgmt-tfstate-187402594320-lock"
    encrypt        = "true"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.region
}

provider "null" {}

provider "external" {}

provider "local" {}

provider "time" {}
