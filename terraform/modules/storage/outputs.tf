output "bucket_name" {
  description = "Name of the created bucket"
  value       = digitalocean_spaces_bucket.loki_storage.name
}

output "bucket_domain_name" {
  description = "FQDN of the bucket"
  value       = digitalocean_spaces_bucket.loki_storage.bucket_domain_name
}

output "bucket_urn" {
  description = "Uniform resource name of the bucket"
  value       = digitalocean_spaces_bucket.loki_storage.urn
}

output "spaces_endpoint" {
  description = "Spaces endpoint URL"
  value       = "https://${var.spaces_region}.digitaloceanspaces.com"
}

output "bucket_region" {
  description = "Region of the bucket"
  value       = digitalocean_spaces_bucket.loki_storage.region
}