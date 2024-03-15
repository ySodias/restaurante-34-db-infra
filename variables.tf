# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "access_key" {
  description = "Access key to AWS Console"
  default     = "<secret_key>"
}

variable "secret_key" {
  description = "Secret key to AWS console"
  default     = "<secret_key>"
}

variable "list_subnet" {
  type        = list(any)
  default     = ["<lista_subnets>"]
  description = "The subnets to use"
}

variable "vpc_id" {
  description = "The VPC to use"
  default     = "<id_vpc>"
}

variable "db_username" {
  description = "The VPC to use"
  default     = "<username>"
}

variable "db_password" {
  description = "RDS root user password"
  sensitive   = true
  default     = "<password>"
}