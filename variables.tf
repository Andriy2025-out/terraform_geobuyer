variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Name of the DigitalOcean project"
  type        = string
  default     = "first-project"
}

# Cluster 1: geobuyerapi-cluster
variable "api_cluster_name" {
  description = "Name of the API Kubernetes cluster"
  type        = string
  default     = "geobuyerapi-cluster"
}

variable "api_region" {
  description = "Region for the API cluster"
  type        = string
  default     = "fra1"
  validation {
    condition     = var.api_region == "fra1"
    error_message = "API cluster region must be fra1."
  }
}

variable "api_kubernetes_version" {
  description = "Kubernetes version for the API cluster"
  type        = string
  default     = "1.30.2-do.0"
  validation {
    condition     = contains(["1.30.2-do.0", "1.32.2-do.1"], var.api_kubernetes_version)
    error_message = "API Kubernetes version must be 1.30.2-do.0 or 1.32.2-do.1."
  }
}

variable "api_ha" {
  description = "Enable high-availability for the API cluster"
  type        = bool
  default     = true
}

variable "api_surge_upgrade" {
  description = "Enable surge upgrades for the API cluster"
  type        = bool
  default     = true
}

variable "api_vpc_uuid" {
  description = "VPC UUID for the API cluster"
  type        = string
  default     = "248871e3-f264-417c-ad0c-caf8da88e8f3"
}

variable "api_maintenance_day" {
  description = "Maintenance day for the API cluster"
  type        = string
  default     = "any"
}

variable "api_maintenance_start_time" {
  description = "Maintenance start time for the API cluster"
  type        = string
  default     = "18:00"
}

variable "api_node_pool_1_name" {
  description = "Name of the first node pool for the API cluster"
  type        = string
  default     = "pool-4-8g"
}

variable "api_node_pool_1_size" {
  description = "Node size for the first node pool of the API cluster"
  type        = string
  default     = "s-4vcpu-8gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.api_node_pool_1_size)
    error_message = "API node pool 1 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "api_node_pool_1_count" {
  description = "Node count for the first node pool of the API cluster"
  type        = number
  default     = 4
}

variable "api_node_pool_1_auto_scale" {
  description = "Enable auto-scaling for the first node pool of the API cluster"
  type        = bool
  default     = true
}

variable "api_node_pool_1_min_nodes" {
  description = "Minimum nodes for the first node pool of the API cluster"
  type        = number
  default     = 3
}

variable "api_node_pool_1_max_nodes" {
  description = "Maximum nodes for the first node pool of the API cluster"
  type        = number
  default     = 6
}

variable "api_node_pool_1_tags" {
  description = "Tags for the first node pool of the API cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker", "k8s:701fc34c-0aca-4404-929b-4108dfa8d0c7"]
}

variable "api_node_pool_2_name" {
  description = "Name of the second node pool for the API cluster"
  type        = string
  default     = "pool-es-8-16"
}

variable "api_node_pool_2_size" {
  description = "Node size for the second node pool of the API cluster"
  type        = string
  default     = "s-8vcpu-16gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.api_node_pool_2_size)
    error_message = "API node pool 2 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "api_node_pool_2_count" {
  description = "Node count for the second node pool of the API cluster"
  type        = number
  default     = 3
}

variable "api_node_pool_2_auto_scale" {
  description = "Enable auto-scaling for the second node pool of the API cluster"
  type        = bool
  default     = false
}

variable "api_node_pool_2_tags" {
  description = "Tags for the second node pool of the API cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker", "k8s:701fc34c-0aca-4404-929b-4108dfa8d0c7"]
}

variable "api_node_pool_2_taint_key" {
  description = "Taint key for the second node pool of the API cluster"
  type        = string
  default     = "instancetype"
}

variable "api_node_pool_2_taint_value" {
  description = "Taint value for the second node pool of the API cluster"
  type        = string
  default     = "elasticsearch"
}

variable "api_node_pool_2_taint_effect" {
  description = "Taint effect for the second node pool of the API cluster"
  type        = string
  default     = "NoSchedule"
}

variable "api_tags" {
  description = "Tags for the API cluster"
  type        = list(string)
  default     = ["geobuyer", "k8s", "k8s:701fc34c-0aca-4404-929b-4108dfa8d0c7"]
}

# Cluster 2: geobuyer-staging-cluster-staging
variable "staging_cluster_name" {
  description = "Name of the Staging Kubernetes cluster"
  type        = string
  default     = "geobuyer-staging-cluster-staging"
}

variable "staging_region" {
  description = "Region for the Staging cluster"
  type        = string
  default     = "fra1"
  validation {
    condition     = var.staging_region == "fra1"
    error_message = "Staging cluster region must be fra1."
  }
}

variable "staging_kubernetes_version" {
  description = "Kubernetes version for the Staging cluster"
  type        = string
  default     = "1.30.2-do.0"
  validation {
    condition     = contains(["1.30.2-do.0", "1.32.2-do.1"], var.staging_kubernetes_version)
    error_message = "Staging Kubernetes version must be 1.30.2-do.0 or 1.32.2-do.1."
  }
}

variable "staging_ha" {
  description = "Enable high-availability for the Staging cluster"
  type        = bool
  default     = false
}

variable "staging_surge_upgrade" {
  description = "Enable surge upgrades for the Staging cluster"
  type        = bool
  default     = true
}

variable "staging_vpc_uuid" {
  description = "VPC UUID for the Staging cluster"
  type        = string
  default     = "90c74023-dc7f-40d4-a58d-03e946a72028"
}

variable "staging_maintenance_day" {
  description = "Maintenance day for the Staging cluster"
  type        = string
  default     = "any"
}

variable "staging_maintenance_start_time" {
  description = "Maintenance start time for the Staging cluster"
  type        = string
  default     = "12:00"
}

variable "staging_node_pool_1_name" {
  description = "Name of the first node pool for the Staging cluster"
  type        = string
  default     = "pool-4-8g"
}

variable "staging_node_pool_1_size" {
  description = "Node size for the first node pool of the Staging cluster"
  type        = string
  default     = "s-4vcpu-8gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.staging_node_pool_1_size)
    error_message = "Staging node pool 1 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "staging_node_pool_1_count" {
  description = "Node count for the first node pool of the Staging cluster"
  type        = number
  default     = 4
}

variable "staging_node_pool_1_auto_scale" {
  description = "Enable auto-scaling for the first node pool of the Staging cluster"
  type        = bool
  default     = true
}

variable "staging_node_pool_1_min_nodes" {
  description = "Minimum nodes for the first node pool of the Staging cluster"
  type        = number
  default     = 3
}

variable "staging_node_pool_1_max_nodes" {
  description = "Maximum nodes for the first node pool of the Staging cluster"
  type        = number
  default     = 5
}

variable "staging_node_pool_1_tags" {
  description = "Tags for the first node pool of the Staging cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker"]
}

variable "staging_node_pool_2_name" {
  description = "Name of the second node pool for the Staging cluster"
  type        = string
  default     = "pool-es-4-8"
}

variable "staging_node_pool_2_size" {
  description = "Node size for the second node pool of the Staging cluster"
  type        = string
  default     = "s-4vcpu-8gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.staging_node_pool_2_size)
    error_message = "Staging node pool 2 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "staging_node_pool_2_count" {
  description = "Node count for the second node pool of the Staging cluster"
  type        = number
  default     = 3
}

variable "staging_node_pool_2_tags" {
  description = "Tags for the second node pool of the Staging cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker"]
}

variable "staging_node_pool_2_taint_key" {
  description = "Taint key for the second node pool of the Staging cluster"
  type        = string
  default     = "instancetype"
}

variable "staging_node_pool_2_taint_value" {
  description = "Taint value for the second node pool of the Staging cluster"
  type        = string
  default     = "elasticsearch"
}

variable "staging_node_pool_2_taint_effect" {
  description = "Taint effect for the second node pool of the Staging cluster"
  type        = string
  default     = "NoSchedule"
}

variable "staging_tags" {
  description = "Tags for the Staging cluster"
  type        = list(string)
  default     = ["geobuyer-staging", "k8s", "k8s:20020c98-e218-4ef6-b58e-659adeecbdb4"]
}

# Cluster 3: geobuyer-dev
variable "dev_cluster_name" {
  description = "Name of the Dev Kubernetes cluster"
  type        = string
  default     = "geobuyer-dev"
}

variable "dev_region" {
  description = "Region for the Dev cluster"
  type        = string
  default     = "fra1"
  validation {
    condition     = var.dev_region == "fra1"
    error_message = "Dev cluster region must be fra1."
  }
}

variable "dev_kubernetes_version" {
  description = "Kubernetes version for the Dev cluster"
  type        = string
  default     = "1.32.2-do.1"
  validation {
    condition     = contains(["1.30.2-do.0", "1.32.2-do.1"], var.dev_kubernetes_version)
    error_message = "Dev Kubernetes version must be 1.30.2-do.0 or 1.32.2-do.1."
  }
}

variable "dev_ha" {
  description = "Enable high-availability for the Dev cluster"
  type        = bool
  default     = false
}

variable "dev_surge_upgrade" {
  description = "Enable surge upgrades for the Dev cluster"
  type        = bool
  default     = true
}

variable "dev_vpc_uuid" {
  description = "VPC UUID for the Dev cluster"
  type        = string
  default     = "2efe04f6-a641-4286-aa1d-6f32f40f6fd0"
}

variable "dev_maintenance_day" {
  description = "Maintenance day for the Dev cluster"
  type        = string
  default     = "any"
}

variable "dev_maintenance_start_time" {
  description = "Maintenance start time for the Dev cluster"
  type        = string
  default     = "20:00"
}

variable "dev_node_pool_1_name" {
  description = "Name of the first node pool for the Dev cluster"
  type        = string
  default     = "pool-2cpu-4gb"
}

variable "dev_node_pool_1_size" {
  description = "Node size for the first node pool of the Dev cluster"
  type        = string
  default     = "s-2vcpu-4gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.dev_node_pool_1_size)
    error_message = "Dev node pool 1 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "dev_node_pool_1_count" {
  description = "Node count for the first node pool of the Dev cluster"
  type        = number
  default     = 1
}

variable "dev_node_pool_1_auto_scale" {
  description = "Enable auto-scaling for the first node pool of the Dev cluster"
  type        = bool
  default     = true
}

variable "dev_node_pool_1_min_nodes" {
  description = "Minimum nodes for the first node pool of the Dev cluster"
  type        = number
  default     = 1
}

variable "dev_node_pool_1_max_nodes" {
  description = "Maximum nodes for the first node pool of the Dev cluster"
  type        = number
  default     = 3
}

variable "dev_node_pool_1_tags" {
  description = "Tags for the first node pool of the Dev cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker"]
}

variable "dev_node_pool_2_name" {
  description = "Name of the second node pool for the Dev cluster"
  type        = string
  default     = "pool-4cpu-8gb"
}

variable "dev_node_pool_2_size" {
  description = "Node size for the second node pool of the Dev cluster"
  type        = string
  default     = "s-4vcpu-8gb"
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.dev_node_pool_2_size)
    error_message = "Dev node pool 2 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "dev_node_pool_2_count" {
  description = "Node count for the second node pool of the Dev cluster"
  type        = number
  default     = 3
}

variable "dev_node_pool_2_auto_scale" {
  description = "Enable auto-scaling for the second node pool of the Dev cluster"
  type        = bool
  default     = true
}

variable "dev_node_pool_2_min_nodes" {
  description = "Minimum nodes for the second node pool of the Dev cluster"
  type        = number
  default     = 1
}

variable "dev_node_pool_2_max_nodes" {
  description = "Maximum nodes for the second node pool of the Dev cluster"
  type        = number
  default     = 3
}

variable "dev_node_pool_2_tags" {
  description = "Tags for the second node pool of the Dev cluster"
  type        = list(string)
  default     = ["k8s", "k8s:worker"]
}

variable "dev_tags" {
  description = "Tags for the Dev cluster"
  type        = list(string)
  default     = ["geobuyer-dev", "k8s", "k8s:866dddf3-bffe-4892-8f3b-e839d3f8b93f"]
}