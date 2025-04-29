terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  # Backend configured by HCP Workspace
}


variable queue_prefix {
    type = string
}

variable environment_tag {
    type = string
}

module dev_queue {
    source  = "app.terraform.io/tf-advanced-labs-ajdelucia/sqs-secure/aws"
    version = "1.0.0"
    
    queue_name_prefix = var.queue_prefix
    enable_dlq = true

    tags = {
        Project = "Advanced TF Course"
        Environment = var.environment_tag
    }
}