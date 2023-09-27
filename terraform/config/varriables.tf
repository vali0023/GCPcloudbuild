variable "credentials_file" {
  description = "Path to the GCP service account key JSON file"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
}

variable "subnet_ranges" {
  description = "List of subnet IP CIDR ranges"
  type        = list(string)
}

