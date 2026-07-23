terraform {
  backend "s3" {
    bucket       = "abdi-eks-gitops-tfstate-319556312800-ca-central-1"
    key          = "dev/terraform.tfstate"
    region       = "ca-central-1"
    encrypt      = true
    use_lockfile = true
  }
}
