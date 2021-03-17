# output "bucket" {
#   value       = google_storage_bucket.state-bucket.name
#   description = "Terraform backend storage bucket"
# }

# output "project_id" {
#   value       = var.gcp_project_id
#   description = "The project ID"
# }

output "topic_name" {
  value       = google_pubsub_topic.orders.name
  description = "The name of the Pub/Sub topic created"
}
