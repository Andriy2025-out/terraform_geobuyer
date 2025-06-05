variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Name of the Spaces bucket for Loki storage"
  type        = string
}

variable "spaces_region" {
  description = "DigitalOcean Spaces region"
  type        = string
  default     = "nyc3"

  validation {
    condition = contains([
      "nyc3", "ams3", "sgp1", "fra1", "sfo3", "blr1", "syd1"
    ], var.spaces_region)
    error_message = "Spaces region must be one of: nyc3, ams3, sgp1, fra1, sfo3, blr1, syd1."
  }
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "noncurrent_version_expiration_days" {
  description = "Number of days to retain non-current versions"
  type        = number
  default     = 7
}

variable "create_project" {
  description = "Create a separate project for storage resources"
  type        = bool
  default     = false
}

variable "project_name" {
  description = "Name of the project (if create_project is true)"
  type        = string
  default     = "Loki Storage"
}

variable "project_description" {
  description = "Description of the project"
  type        = string
  default     = "Storage resources for Loki logging"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}