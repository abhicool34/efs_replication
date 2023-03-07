# locals {
#   subnet_ids = split(",",data.terraform_remote_state.vpc.outputs)
# }

locals{
    replication_enabled = var.replication_enabled
}