terraform {
  backend "s3" {
    bucket = "batch78-bucket"
    key    = "tools/terraform-state"
    region = "us-east-1"
  }
}

