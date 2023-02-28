# output "replicated_file_system_arn" {
#   value = aws_efs_replication_configuration.replication_secondary.destination[0].file_system_id
# }

output "replicated_file_system_id" {
  value = aws_efs_replication_configuration.replication_secondary.id
}