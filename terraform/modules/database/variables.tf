variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the database cluster"
  type        = string
}

variable "database_engine" {
  description = "Database engine (postgresql, mysql, redis, mongodb)"
  type        = string
  default     = "postgresql"

  validation {
    condition     = contains(["postgresql", "mysql", "redis", "mongodb"], var.database_engine)
    error_message = "Database engine must be postgresql, mysql, redis, or mongodb."
  }
}

variable "database_version" {
  description = "Database version"
  type        = string
  default     = "15"
}

variable "database_size" {
  description = "Database droplet size"
  type        = string
  default     = "db-s-1vcpu-2gb" # Basic - Shared CPU / 1 vCPU / 2 GB RAM
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the database cluster"
  type        = number
  default     = 1 # Primary only
}

variable "app_database_name" {
  description = "Name of the application database"
  type        = string
  default     = "app"
}

variable "app_user_name" {
  description = "Name of the application database user"
  type        = string
  default     = "app_user"
}

variable "database_tags" {
  description = "Tags for the database cluster"
  type        = list(string)
  default     = []
}