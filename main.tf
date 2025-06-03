terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

# DigitalOcean Project
resource "digitalocean_project" "my_project" {
  name        = var.project_name
  description = "Update your project information under Settings"
}

# Cluster 1: geobuyerapi-cluster
resource "digitalocean_kubernetes_cluster" "api_cluster" {
  name            = var.api_cluster_name
  region          = var.api_region
  version         = var.api_kubernetes_version
  ha              = var.api_ha
  surge_upgrade   = var.api_surge_upgrade
  vpc_uuid        = var.api_vpc_uuid
  tags            = var.api_tags
  registry_integration = true
  destroy_all_associated_resources = false


  maintenance_policy {
    day        = var.api_maintenance_day
    start_time = var.api_maintenance_start_time
  }

  node_pool {
    name       = var.api_node_pool_1_name
    size       = var.api_node_pool_1_size
    node_count = var.api_node_pool_1_count
    auto_scale = var.api_node_pool_1_auto_scale
    min_nodes  = var.api_node_pool_1_min_nodes
    max_nodes  = var.api_node_pool_1_max_nodes
    tags       = var.api_node_pool_1_tags
  }
}

resource "digitalocean_kubernetes_node_pool" "api_node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.api_cluster.id
  name       = var.api_node_pool_2_name
  size       = var.api_node_pool_2_size
  node_count = var.api_node_pool_2_count
  auto_scale = var.api_node_pool_2_auto_scale
  tags       = var.api_node_pool_2_tags
  taint {
    key    = var.api_node_pool_2_taint_key
    value  = var.api_node_pool_2_taint_value
    effect = var.api_node_pool_2_taint_effect
  }
}

# Cluster 2: geobuyer-staging-cluster-staging
resource "digitalocean_kubernetes_cluster" "staging_cluster" {
  name            = var.staging_cluster_name
  region          = var.staging_region
  version         = var.staging_kubernetes_version
  ha              = var.staging_ha
  surge_upgrade   = var.staging_surge_upgrade
  vpc_uuid        = var.staging_vpc_uuid
  tags            = var.staging_tags
  registry_integration = true
  destroy_all_associated_resources = false


  maintenance_policy {
    day        = var.staging_maintenance_day
    start_time = var.staging_maintenance_start_time
  }

  node_pool {
    name       = var.staging_node_pool_1_name
    size       = var.staging_node_pool_1_size
    node_count = var.staging_node_pool_1_count
    auto_scale = var.staging_node_pool_1_auto_scale
    min_nodes  = var.staging_node_pool_1_min_nodes
    max_nodes  = var.staging_node_pool_1_max_nodes
    tags       = var.staging_node_pool_1_tags
  }
}

resource "digitalocean_kubernetes_node_pool" "staging_node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.staging_cluster.id
  name       = var.staging_node_pool_2_name
  size       = var.staging_node_pool_2_size
  node_count = var.staging_node_pool_2_count
  tags       = var.staging_node_pool_2_tags
  taint {
    key    = var.staging_node_pool_2_taint_key
    value  = var.staging_node_pool_2_taint_value
    effect = var.staging_node_pool_2_taint_effect
  }
}

# Cluster 3: geobuyer-dev
resource "digitalocean_kubernetes_cluster" "dev_cluster" {
  name            = var.dev_cluster_name
  region          = var.dev_region
  version         = var.dev_kubernetes_version
  ha              = var.dev_ha
  surge_upgrade   = var.dev_surge_upgrade
  vpc_uuid        = var.dev_vpc_uuid
  tags            = var.dev_tags
  registry_integration = true
  destroy_all_associated_resources = false

  maintenance_policy {
    day        = var.dev_maintenance_day
    start_time = var.dev_maintenance_start_time
  }

  node_pool {
    name       = var.dev_node_pool_1_name
    size       = var.dev_node_pool_1_size
    node_count = var.dev_node_pool_1_count
    auto_scale = var.dev_node_pool_1_auto_scale
    min_nodes  = var.dev_node_pool_1_min_nodes
    max_nodes  = var.dev_node_pool_1_max_nodes
    tags       = var.dev_node_pool_1_tags
  }
}

resource "digitalocean_kubernetes_node_pool" "dev_node_pool_2" {
  cluster_id = digitalocean_kubernetes_cluster.dev_cluster.id
  name       = var.dev_node_pool_2_name
  size       = var.dev_node_pool_2_size
  node_count = var.dev_node_pool_2_count
  auto_scale = var.dev_node_pool_2_auto_scale
  min_nodes  = var.dev_node_pool_2_min_nodes
  max_nodes  = var.dev_node_pool_2_max_nodes
  tags       = var.dev_node_pool_2_tags
}

# Assign Clusters to Project
resource "digitalocean_project_resources" "project_clusters" {
  project = digitalocean_project.my_project.id
  resources = [
    digitalocean_kubernetes_cluster.api_cluster.urn,
    digitalocean_kubernetes_cluster.staging_cluster.urn,
    digitalocean_kubernetes_cluster.dev_cluster.urn
  ]
}