terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

module "vpc" {
  source    = "../../modules/vpc"
  vpc_name  = var.vpc_name
  region    = var.region
  ip_range  = var.vpc_ip_range
}

module "kubernetes" {
  do_token = var.do_token
  source                = "../../modules/kubernetes"
  project_name          = var.project_name
  project_description   = "Staging environment for GeoBuyer"
  cluster_name          = var.cluster_name
  region                = var.region
  kubernetes_version    = var.kubernetes_version
  ha                    = var.ha
  surge_upgrade         = var.surge_upgrade
  vpc_id                = module.vpc.vpc_id
  maintenance_day       = var.maintenance_day
  maintenance_start_time = var.maintenance_start_time
  node_pool_1_name      = var.node_pool_1_name
  node_pool_1_size      = var.node_pool_1_size
  node_pool_1_count     = var.node_pool_1_count
  node_pool_1_auto_scale = var.node_pool_1_auto_scale
  node_pool_1_min_nodes = var.node_pool_1_min_nodes
  node_pool_1_max_nodes = var.node_pool_1_max_nodes
  node_pool_1_tags      = var.node_pool_1_tags
  node_pool_2_name      = var.node_pool_2_name
  node_pool_2_size      = var.node_pool_2_size
  node_pool_2_count     = var.node_pool_2_count
  node_pool_2_auto_scale = var.node_pool_2_auto_scale
  node_pool_2_min_nodes = var.node_pool_2_min_nodes
  node_pool_2_max_nodes = var.node_pool_2_max_nodes
  node_pool_2_tags      = var.node_pool_2_tags
  node_pool_2_taint_key = var.node_pool_2_taint_key
  node_pool_2_taint_value = var.node_pool_2_taint_value
  node_pool_2_taint_effect = var.node_pool_2_taint_effect
  cluster_tags          = var.cluster_tags
}