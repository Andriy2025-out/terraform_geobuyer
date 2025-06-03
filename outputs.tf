output "api_cluster_endpoint" {
  description = "Endpoint for the API Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.api_cluster.endpoint
}

output "api_cluster_id" {
  description = "ID of the API Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.api_cluster.id
}

output "api_kubeconfig" {
  description = "Kubeconfig for the API cluster"
  value       = digitalocean_kubernetes_cluster.api_cluster.kube_config[0].raw_config
  sensitive   = true
}

output "staging_cluster_endpoint" {
  description = "Endpoint for the Staging Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.staging_cluster.endpoint
}

output "staging_cluster_id" {
  description = "ID of the Staging Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.staging_cluster.id
}

output "staging_kubeconfig" {
  description = "Kubeconfig for the Staging cluster"
  value       = digitalocean_kubernetes_cluster.staging_cluster.kube_config[0].raw_config
  sensitive   = true
}

output "dev_cluster_endpoint" {
  description = "Endpoint for the Dev Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.dev_cluster.endpoint
}

output "dev_cluster_id" {
  description = "ID of the Dev Kubernetes cluster"
  value       = digitalocean_kubernetes_cluster.dev_cluster.id
}

output "dev_kubeconfig" {
  description = "Kubeconfig for the Dev cluster"
  value       = digitalocean_kubernetes_cluster.dev_cluster.kube_config[0].raw_config
  sensitive   = true
}