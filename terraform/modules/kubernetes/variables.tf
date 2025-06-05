variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "project_name" {
  description = "Name of the DigitalOcean project"
  type        = string
}

variable "project_description" {
  description = "Description of the DigitalOcean project"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "region" {
  description = "Region for the cluster"
  type        = string
  validation {
    condition     = var.region == "fra1"
    error_message = "Region must be fra1."
  }
}

variable "kubernetes_version" {
  description = "Kubernetes version for the cluster (leave null for latest)"
  type        = string
  default     = null

  validation {
    condition     = var.kubernetes_version == null || can(regex("^\\d+\\.\\d+\\.\\d+-do\\.\\d+$", var.kubernetes_version))
    error_message = "Kubernetes version must be in format 'x.y.z-do.n' or null for latest."
  }
}

variable "ha" {
  description = "Enable high-availability for the cluster"
  type        = bool
}

variable "surge_upgrade" {
  description = "Enable surge upgrades for the cluster"
  type        = bool
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "maintenance_day" {
  description = "Maintenance day for the cluster"
  type        = string
}

variable "maintenance_start_time" {
  description = "Maintenance start time for the cluster"
  type        = string
}

variable "node_pool_1_name" {
  description = "Name of the first node pool"
  type        = string
}

variable "node_pool_1_size" {
  description = "Node size for the first node pool"
  type        = string
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.node_pool_1_size)
    error_message = "Node pool 1 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "node_pool_1_count" {
  description = "Node count for the first node pool"
  type        = number
}

variable "node_pool_1_auto_scale" {
  description = "Enable auto-scaling for the first node pool"
  type        = bool
}

variable "node_pool_1_min_nodes" {
  description = "Minimum nodes for the first node pool"
  type        = number
}

variable "node_pool_1_max_nodes" {
  description = "Maximum nodes for the first node pool"
  type        = number
}

variable "node_pool_1_tags" {
  description = "Tags for the first node pool"
  type        = list(string)
}

variable "node_pool_2_name" {
  description = "Name of the second node pool"
  type        = string
}

variable "node_pool_2_size" {
  description = "Node size for the second node pool"
  type        = string
  validation {
    condition     = contains(["s-2vcpu-4gb", "s-4vcpu-8gb", "s-8vcpu-16gb"], var.node_pool_2_size)
    error_message = "Node pool 2 size must be one of: s-2vcpu-4gb, s-4vcpu-8gb, s-8vcpu-16gb."
  }
}

variable "node_pool_2_count" {
  description = "Node count for the second node pool"
  type        = number
}

variable "node_pool_2_auto_scale" {
  description = "Enable auto-scaling for the second node pool"
  type        = bool
}

variable "node_pool_2_min_nodes" {
  description = "Minimum nodes for the second node pool"
  type        = number
}

variable "node_pool_2_max_nodes" {
  description = "Maximum nodes for the second node pool"
  type        = number
}

variable "node_pool_2_tags" {
  description = "Tags for the second node pool"
  type        = list(string)
}

variable "node_pool_2_taint_key" {
  description = "Taint key for the second node pool"
  type        = string
  default     = ""
}

variable "node_pool_2_taint_value" {
  description = "Taint value for the second node pool"
  type        = string
  default     = ""
}

variable "node_pool_2_taint_effect" {
  description = "Taint effect for the second node pool"
  type        = string
  default     = ""
}

variable "cluster_tags" {
  description = "Tags for the cluster"
  type        = list(string)
}