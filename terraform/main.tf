module "network" {
  source = "./modules/network"

  project_id    = "project-eff7c2ad-c9a5-425e-96b"
  region        = "us-central1"
  network_name  = "gke-vpc"
  subnet_name   = "gke-subnet"
  ip_cidr_range = "10.10.0.0/16"
}

module "gke" {
  source = "./modules/gke"

  zone           = "us-central1-a"
  gke_name       = "gke-cluster"
  node_pool_name = "primary-pool"
  machine_type   = "e2-medium"
  min_node_count = 1
  max_node_count = 99
}