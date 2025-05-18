terraform {
  backend "s3" {
    bucket       = "3-tier-terraform-bucket"
    key          = "terraform/state"
    region       = "us-east-1"
    use_lockfile = true
    profile = "admin"
  }
}