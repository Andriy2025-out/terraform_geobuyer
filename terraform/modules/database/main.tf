# modules/database/main.tf
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_database_cluster" "main" {
  name       = var.database_name
  engine     = var.database_engine
  version    = var.database_version
  size       = var.database_size
  region     = var.region
  node_count = var.node_count

  tags = var.database_tags
}

resource "digitalocean_database_db" "app_database" {
  cluster_id = digitalocean_database_cluster.main.id
  name       = var.app_database_name
}

resource "digitalocean_database_user" "app_user" {
  cluster_id = digitalocean_database_cluster.main.id
  name       = var.app_user_name
}

