provider "aws" {
  region = var.aws_region
}

provider "aws" {
  alias  = "west"
  region = "us-west-2"
}