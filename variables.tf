variable "aws_region" {
    default = "us-east-1"
}

variable "envrionment_name" {
    default = "dev"
}

variable "replication_enabled" {
    type    = bool
    default = true
}