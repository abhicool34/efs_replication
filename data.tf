# data "terraform_remote_state" "efs" {
#   backend = "s3"
#   config = {
#     bucket = "terraform-new-state"
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#   }
# }
