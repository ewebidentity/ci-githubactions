variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region in which to deploy"
}

variable "gcp_zone" {
  type        = string
  description = "The GCP zone in which to deploy"
}

variable "gcp_topic_name" {
  type        = string
  description = "The name for Pub/Sub topic on GCP"
}

variable "gcp_subscription_name" {
  type        = string
  description = "The name for Pub/Sub subscription on GCP"
}