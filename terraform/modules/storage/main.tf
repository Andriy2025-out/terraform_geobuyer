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

# Spaces bucket for Loki storage
resource "digitalocean_spaces_bucket" "loki_storage" {
  name   = var.bucket_name
  region = var.spaces_region

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle_rule {
    id      = "loki_logs_lifecycle"
    enabled = true

    expiration {
      days = var.log_retention_days
    }

    noncurrent_version_expiration {
      days = var.noncurrent_version_expiration_days
    }
  }
}

# Create access key for Loki to access the bucket
resource "digitalocean_spaces_bucket_cors_configuration" "loki_cors" {
  bucket = digitalocean_spaces_bucket.loki_storage.name
  region = digitalocean_spaces_bucket.loki_storage.region

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE", "HEAD"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }
}

# Create a project for better organization (optional)
resource "digitalocean_project" "storage_project" {
  count       = var.create_project ? 1 : 0
  name        = var.project_name
  description = var.project_description
  purpose     = "Loki log storage"
  environment = var.environment
}

resource "digitalocean_project_resources" "storage_resources" {
  count   = var.create_project ? 1 : 0
  project = digitalocean_project.storage_project[0].id
  resources = [
    digitalocean_spaces_bucket.loki_storage.urn
  ]
}