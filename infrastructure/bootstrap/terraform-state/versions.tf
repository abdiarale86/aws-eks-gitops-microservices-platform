terraform {
  required_version = ">= 1.15.0, < 2.0.0"

  backend "s3" {
    bucket       = "abdi-eks-gitops-tfstate-319556312800-ca-central-1"
    key          = "bootstrap/terraform.tfstate"
    region       = "ca-central-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.54"
    }
  }
}
