output "database_cluster_id" {
  description = "ID of the database cluster"
  value       = digitalocean_database_cluster.main.id
}

output "database_host" {
  description = "Database host"
  value       = digitalocean_database_cluster.main.host
  sensitive   = true
}

output "database_port" {
  description = "Database port"
  value       = digitalocean_database_cluster.main.port
}

output "database_name" {
  description = "Database name"
  value       = digitalocean_database_db.app_database.name
}

output "database_username" {
  description = "Database username"
  value       = digitalocean_database_user.app_user.name
}

output "database_password" {
  description = "Database password"
  value       = digitalocean_database_user.app_user.password
  sensitive   = true
}

output "database_uri" {
  description = "Database connection URI"
  value       = digitalocean_database_cluster.main.uri
  sensitive   = true
}

output "database_connection_pool_uri" {
  description = "Database connection pool URI"
  value       = digitalocean_database_cluster.main.private_uri
  sensitive   = true
}