# resource "google_container_cluster" "gke" {
#   name     = var.gke_name
#   location = var.zone

#   # network    = google_compute_network.vpc.id
#   # subnetwork = google_compute_subnetwork.subnet.id

#   network    = var.network
#   subnetwork = var.subnetwork

#   deletion_protection = true

#   remove_default_node_pool = true
#   initial_node_count       = 1

#   networking_mode = "VPC_NATIVE"

#   ip_allocation_policy {
#     cluster_secondary_range_name  = "pods"
#     services_secondary_range_name = "services"
#   }
# }


# resource "google_container_node_pool" "primary" {
#   name     = var.node_pool_name
#   location = var.zone
#   cluster  = google_container_cluster.gke.id

#   autoscaling {
#     min_node_count = var.min_node_count # scales from 1 to 99 nodes
#     max_node_count = var.max_node_count
#   }

#   node_config {
#     machine_type = var.machine_type

#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }