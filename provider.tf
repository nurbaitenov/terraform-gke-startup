terraform {
  required_version = ">= 1.8"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }

    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}


provider "kubernetes" {
  host = "https://${google_container_cluster.gke.endpoint}"

  token = data.google_client_config.default.access_token

  cluster_ca_certificate = base64decode(
    google_container_cluster.gke.master_auth[0].cluster_ca_certificate
  )
}

data "google_client_config" "default" {}

provider "helm" {
  kubernetes = {
    host = "https://${google_container_cluster.gke.endpoint}"

    token = data.google_client_config.default.access_token

    cluster_ca_certificate = base64decode(
      google_container_cluster.gke.master_auth[0].cluster_ca_certificate
    )
  }
}
