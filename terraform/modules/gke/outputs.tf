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