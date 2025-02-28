terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  backend "s3" {
    bucket = "bucketstmlterraform"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "samueltlara"
      managed-by = "terraform"
    }
  }

}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "bucketstmlterraform"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }

  depends_on = [
    aws_vpc.terraformvpc,
    aws_subnet.subnetpublic,
    aws_subnet.subnetprivate,
    aws_security_group.Terraform_SG,
    aws_nat_gateway.meunat 
  ]
}