output "vpc_id" {
  description = "The ID of the created VPC"
  value       = digitalocean_vpc.cluster_vpc.id
}

output "vpc_name" {
  description = "The name of the created VPC"
  value       = digitalocean_vpc.cluster_vpc.name
}