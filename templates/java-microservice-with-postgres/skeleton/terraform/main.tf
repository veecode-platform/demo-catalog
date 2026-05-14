terraform {
  required_version = ">= 1.5"
  required_providers {
    aws    = { source = "hashicorp/aws", version = "~> 5.0" }
    random = { source = "hashicorp/random", version = "~> 3.6" }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_db_subnet_group" "this" {
  name       = "${{ '${var.service_name}' }}-db-subnet"
  subnet_ids = var.subnet_ids
  tags       = local.tags
}

resource "aws_security_group" "db" {
  name        = "${{ '${var.service_name}' }}-db"
  description = "Postgres access for ${{ '${var.service_name}' }}"
  vpc_id      = var.vpc_id

  ingress {
    description = "Postgres from allowed CIDRs"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "random_password" "master" {
  length  = 32
  special = false
}

resource "aws_db_instance" "this" {
  identifier              = "${{ '${var.service_name}' }}-db"
  engine                  = "postgres"
  engine_version          = "16.4"
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  db_name                 = var.db_name
  username                = "app"
  password                = random_password.master.result
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.db.id]
  publicly_accessible     = false
  backup_retention_period = var.backup_retention_days
  storage_encrypted       = true
  skip_final_snapshot     = var.environment != "prod"
  apply_immediately       = var.environment != "prod"
  deletion_protection     = var.environment == "prod"

  tags = local.tags
}

locals {
  tags = {
    Service     = var.service_name
    Environment = var.environment
    ManagedBy   = "terraform"
    Template    = "java-microservice-with-postgres"
  }
}
