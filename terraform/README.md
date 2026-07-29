# Instruction how to build modules


### Network module
```
module "network" {
  source = "./modules/network"

  project_id    = var.project_id
  region        = var.region
  network_name  = var.network_name
  subnet_name   = var.subnet_name
  ip_cidr_range = var.ip_cidr_range
}
```

### GKE module
```
module "gke" {
  source = "./modules/gke"

  zone           = "us-central1-a"
  gke_name       = "gke-cluster"
  node_pool_name = "primary-pool"
  machine_type   = "e2-medium"
  min_node_count = 1
  max_node_count = 99
}
```



###### terraform apply -var-file=environments/dev.tfvars.example