terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  is_default  = false
  purpose     = "Terraform-managed Kubernetes cluster"
}


variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

data "digitalocean_kubernetes_versions" "latest" {
  version_prefix = "1.32."  # Optional: constrain to specific major.minor
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name                         = var.cluster_name
  region                       = var.region
  version                      = var.kubernetes_version != null ? var.kubernetes_version : data.digitalocean_kubernetes_versions.latest.latest_version
  ha                           = var.ha
  surge_upgrade                = var.surge_upgrade
  vpc_uuid                     = var.vpc_id
  tags                         = var.cluster_tags
  registry_integration         = true
  destroy_all_associated_resources = false
  auto_upgrade                 = false

  maintenance_policy {
    day        = var.maintenance_day
    start_time = var.maintenance_start_time
  }

  node_pool {
    name       = var.node_pool_1_name
    size       = var.node_pool_1_size
    node_count = var.node_pool_1_count
    auto_scale = var.node_pool_1_auto_scale
    min_nodes  = var.node_pool_1_min_nodes
    max_nodes  = var.node_pool_1_max_nodes
    tags       = var.node_pool_1_tags
  }
  lifecycle {
    ignore_changes = [
      version,
      auto_upgrade
    ]
  }
}

resource "digitalocean_kubernetes_node_pool" "node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.cluster.id
  name       = var.node_pool_2_name
  size       = var.node_pool_2_size
  node_count = var.node_pool_2_count
  auto_scale = var.node_pool_2_auto_scale
  min_nodes  = var.node_pool_2_auto_scale ? var.node_pool_2_min_nodes : null
  max_nodes  = var.node_pool_2_auto_scale ? var.node_pool_2_max_nodes : null
  tags       = var.node_pool_2_tags

  dynamic "taint" {
    for_each = var.node_pool_2_taint_key != "" ? [1] : []
    content {
      key    = var.node_pool_2_taint_key
      value  = var.node_pool_2_taint_value
      effect = var.node_pool_2_taint_effect
    }
  }
}

resource "digitalocean_project_resources" "project_clusters" {
  project = digitalocean_project.project.id
  resources = [digitalocean_kubernetes_cluster.cluster.urn]
}