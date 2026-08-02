output "cluster_name" {
  description = "GKE cluster name"
  value       = google_container_cluster.gke.name
}

output "cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = google_container_cluster.gke.endpoint
}

output "node_pool_name" {
  description = "Primary node pool name"
  value       = google_container_node_pool.primary.name
}

# output "network_id" {
#   value = google_compute_network.vpc.id
# }

# output "subnetwork_id" {
#   value = google_compute_subnetwork.subnet.id
# }