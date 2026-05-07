terraform {
  backend "s3" {
    bucket         = "aws-eks-platform-terraform-state"
    key            = "staging/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "aws-eks-platform-terraform-locks"
    encrypt        = true
  }
}