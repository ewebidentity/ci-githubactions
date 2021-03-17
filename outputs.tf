output "bucket" {
  value       = google_storage_bucket.state-bucket.name
  description = "Terraform backend storage bucket"
}

output "project_id" {
  value       = var.gcp_project_id
  description = "The project ID"
}

output "topic_name" {
  value       = module.pubsub.topic
  description = "The name of the Pub/Sub topic created"
}

output "topic_labels" {
  value       = module.pubsub.topic_labels
  description = "The labels of the Pub/Sub topic created"
}
