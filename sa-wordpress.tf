resource "google_service_account" "service_account" {
  account_id   = "service-account-id"
  display_name = "wp-stateless"
  project = var.project_id

}
