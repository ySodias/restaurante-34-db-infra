# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group"
  subnet_ids = var.list_subnet
  tags = {
    Name = "restaurant-34"
  }
}

resource "aws_security_group" "security_group" {
  name   = "security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech-challenge"
  }
}

resource "aws_db_parameter_group" "restaurant-34" {
  name   = "restaurant-34"
  family = "postgres11"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_instance" "restaurant-34" {
  identifier             = "restaurant-34"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "11.17"
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.subnet_group.name
  vpc_security_group_ids = [aws_security_group.security_group.id]
  parameter_group_name   = "default.postgres11"
  publicly_accessible    = true
  skip_final_snapshot    = true
}