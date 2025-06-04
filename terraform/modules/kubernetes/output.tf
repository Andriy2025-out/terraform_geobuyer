output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.cluster.id
}

output "cluster_urn" {
  description = "URN of the Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.cluster.urn
}

output "project_id" {
  description = "ID of the DigitalOcean project"
  value       = digitalocean_project.project.id
}