generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"

  # Using Terragrunt's `get_parent_terragrunt_dir` to dynamically reference parent variables
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "crb-s3-tpqwk59h"
    key            = "global/crb-s3-tpqwk59h/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "crb-s3-locks"
  }
}
EOF
}
