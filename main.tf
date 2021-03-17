provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

resource "google_pubsub_topic" "orders" {
  name = var.gcp_topic_name
}

resource "google_pubsub_subscription" "orders" {
  name  = var.gcp_subscription_name
  topic = google_pubsub_topic.orders.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }
}

# resource "google_pubsub_subscription" "orders" {
#   name  = var.gcp_subscription_name
#   topic = google_pubsub_topic.orders.name

#   ack_deadline_seconds = 20

#   labels = {
#     foo = "bar"
#   }

#   push_config {
#     push_endpoint = "https://${var.project_id}.example.com/"

#     attributes = {
#       x-goog-version = "v1"
#     }
#   }
# }


#   enable_message_ordering = false
# }

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