output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "cluster_endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "network" {
  value = google_compute_network.vpc.name
}

# output "postgres_public_ip" {
#   value = google_sql_database_instance.postgres.public_ip_address
# }

# output "postgres_user" {
#   value = google_sql_user.sonarqube.name
# }