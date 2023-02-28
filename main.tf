resource "aws_efs_file_system" "efs_primary" {
    creation_token = "${var.envrionment_name}-openas2-efs"
    performance_mode = "generalPurpose"
    tags = {
        Name  = "${var.envrionment_name}-openas2-server-efs"
        environment = var.envrionment_name
    }
}

resource "aws_efs_mount_target" "efs_primary" {
    file_system_id = aws_efs_file_system.efs_primary.id
    subnet_id = "subnet-0bd751797d59f68b7"
    security_groups = ["sg-0f5e164fbcc887780"]
}


resource "aws_efs_replication_configuration" "replication_secondary" {
    source_file_system_id = aws_efs_file_system.efs_primary.id
    destination {
      region = "us-west-2"
    }
}

resource "aws_efs_mount_target" "replicated_file_system_arn" {
  provider = aws.west
  depends_on = [aws_efs_replication_configuration.replication_secondary]
  file_system_id = aws_efs_replication_configuration.repl ication_secondary.destination[0].file_system_id
  subnet_id = "subnet-0de9aa7adb8a84bea"

}

# resource "aws_efs_access_point" "efs_secondary" {
#     file_system_id = 

#     posix_user {
#       gid = 0
#       uid = 0
#     }
#     root_directory {
#         path = "/"
#         creation_info {
#             owner_gid = 0
#             owner_uid = 0
#             permissions = "755"

#         }
#     }

#     tags = {
#       "Name" = "${var.envrionment_name}-openas2-efs-access-point"
#     }
  
# }


# resource "aws_efs_file_system" "efs_secondary" {
#     creation_token = "${var.envrionment_name}-openas2-efs-replica"
#     provider = aws.west
#     performance_mode = "generalPurpose"
#     tags = {
#         Name  = "${var.envrionment_name}-openas2-server-efs-replica"
#         environment = var.envrionment_name
#     }
# }

# data "aws_efs_file_system" "efs_secondary" {
#   file_system_id = aws_efs_file_system.efs_secondary.id
#   provider = aws.west
# }
