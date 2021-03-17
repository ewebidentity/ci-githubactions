provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "state-bucket" {
  name          = "tfstate-bucket-${random_id.suffix.hex}"
  location      = var.gcp_region
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
  versioning {
    enabled = true
  }
}