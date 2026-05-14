variable "service_name" {
  description = "Owning service name (used in DB identifier, tags, security group name)."
  type        = string
  default     = "${{ values.componentName }}"
}

variable "db_name" {
  description = "Postgres database name."
  type        = string
  default     = "${{ values.dbName }}"
}

variable "aws_region" {
  description = "AWS region for the RDS instance."
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC where the DB subnet group and security group live."
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the DB subnet group (provide at least 2 AZs)."
  type        = list(string)
}

variable "allowed_cidrs" {
  description = "CIDR blocks allowed to connect to Postgres on 5432."
  type        = list(string)
  default     = []
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "${{ values.instanceClass }}"
}

variable "allocated_storage" {
  description = "Initial allocated storage in GB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Upper bound for storage autoscaling in GB."
  type        = number
  default     = 100
}

variable "backup_retention_days" {
  description = "Number of days to retain automated backups."
  type        = number
  default     = 7
}

variable "environment" {
  description = "Environment label — controls skip_final_snapshot, apply_immediately, deletion_protection."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of dev, staging, prod."
  }
}
