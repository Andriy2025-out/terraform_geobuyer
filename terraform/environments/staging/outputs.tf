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