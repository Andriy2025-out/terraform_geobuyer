output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = module.kubernetes.cluster_id
}

output "cluster_urn" {
  description = "URN of the Kubernetes cluster"
  value       = module.kubernetes.cluster_urn
}

output "project_id" {
  description = "ID of the DigitalOcean project"
  value       = module.kubernetes.project_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}
# Database outputs

output "database_host" {
  description = "Database host"
  value       = module.database.database_host
  sensitive   = true
}

output "database_port" {
  description = "Database port"
  value       = module.database.database_port
}

output "database_name" {
  description = "Database name"
  value       = module.database.database_name
}

output "database_username" {
  description = "Database username"
  value       = module.database.database_username
}

output "database_password" {
  description = "Database password"
  value       = module.database.database_password
  sensitive   = true
}

output "database_uri" {
  description = "Database connection URI"
  value       = module.database.database_uri
  sensitive   = true
}

# Loki storage outputs
output "loki_bucket_name" {
  description = "Loki storage bucket name"
  value       = module.loki_storage.bucket_name
}

output "loki_spaces_endpoint" {
  description = "Loki Spaces endpoint"
  value       = module.loki_storage.spaces_endpoint
}

output "loki_bucket_region" {
  description = "Loki bucket region"
  value       = module.loki_storage.bucket_region
}