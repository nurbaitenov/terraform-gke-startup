resource "google_container_cluster" "gke" {
  name     = "gke-cluster"
  location = var.zone

  network    = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}


resource "google_container_node_pool" "primary" {
  name     = "primary-pool"
  location = var.zone
  cluster  = google_container_cluster.gke.id

  node_count = 1

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}