provider "google" {
  region  = var.region
  zone    = var.zone
  impersonate_service_account = var.service_account
}
