provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "pubsub" {
  source     = "../../"
  project_id = var.gcp_project_id
  topic      = var.gcp_topic_name

  pull_subscriptions = [
    {
      name                 = "pull"
      ack_deadline_seconds = 10
    },
  ]

  push_subscriptions = [
    {
      name                 = "push"
      push_endpoint        = "https://${var.gcp_project_id}.appspot.com/"
      x-goog-version       = "v1beta1"
      ack_deadline_seconds = 20
      expiration_policy    = "1209600s" // two weeks
    },
  ]

}

# resource "random_id" "suffix" {
#   byte_length = 4
# }

# resource "google_storage_bucket" "state-bucket" {
#   name          = "tfstate-bucket-${random_id.suffix.hex}"
#   location      = var.gcp_region
#   force_destroy = true
#   lifecycle {
#     prevent_destroy = false
#   }
#   versioning {
#     enabled = true
#   }
# }