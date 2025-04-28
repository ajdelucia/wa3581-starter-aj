terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" // Use an appropriate AWS provider version
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }

  # Backend is configured implicitly by HCP Terraform Workspace
}

provider "aws" {
  region = "us-west-2" // Ensure correct region
}

# TODO: Add a random_string resource named "suffix"
# TODO: Add an aws_s3_bucket resource named "learning_bucket"
#       using the random suffix to ensure a unique name.
#       Add a tag: Name = "TF Advanced Lab 1 Bucket"

resource random_string suffix {
    length = 8
    special = false
    upper   = false
}

resource aws_s3_bucket learning_bucket {
    bucket = "lab01_learning_bucket_${random_string.suffix.result}"

    tags = {
      Name = "TF Advanced Lab 1 Bucket"
    }
}