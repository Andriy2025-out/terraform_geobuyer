variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "region" {
  description = "DigitalOcean region for the VPC"
  type        = string
}

variable "ip_range" {
  description = "IP range for the VPC"
  type        = string
}