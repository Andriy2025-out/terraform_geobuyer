terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_vpc" "cluster_vpc" {
  name        = var.vpc_name
  region      = var.region
  ip_range    = var.ip_range
  description = "VPC for ${var.vpc_name} cluster"
}