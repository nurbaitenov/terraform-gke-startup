terraform {
  backend "gcs" {
    bucket = "nursdev017-tf-state"
    prefix = "gke/dev"
  }
}