module "network" {
  source = "./modules/network"

  project_id  = var.project_id
  region       = var.region
  network_name = var.network_name
  subnet_name  = var.subnet_name
  ip_cidr_range  = var.ip_cidr_range
}