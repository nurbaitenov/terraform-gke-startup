variable "zone" {
  description = "GKE cluster zone"
  type        = string
}

variable "gke_name" {
  description = "Provide gke_name"
  type        = string
  default     = ""
}

variable "node_pool_name" {
  description = "Provide node_pool_name"
  type        = string
  default     = ""
}

variable "machine_type" {
  description = "Node machine type"
  type        = string
  default     = ""
}

variable "min_node_count" {
  description = "Minimum number of nodes"
  type        = string
  default     = ""
}

variable "max_node_count" {
  description = "Maximum number of nodes"
  type        = string
  default     = ""
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}