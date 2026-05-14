output "db_endpoint" {
  description = "JDBC-ready endpoint host:port for the Postgres instance."
  value       = aws_db_instance.this.endpoint
}

output "db_jdbc_url" {
  description = "Full JDBC URL (use as DB_URL in the service)."
  value       = "jdbc:postgresql://${{ '${aws_db_instance.this.endpoint}' }}/${{ '${aws_db_instance.this.db_name}' }}"
}

output "db_name" {
  description = "Database name created on the instance."
  value       = aws_db_instance.this.db_name
}

output "db_username" {
  description = "Master username (use as DB_USER in the service)."
  value       = aws_db_instance.this.username
  sensitive   = true
}

output "db_password" {
  description = "Generated master password (use as DB_PASSWORD in the service). Rotate before going to prod."
  value       = random_password.master.result
  sensitive   = true
}
