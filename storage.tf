resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static-site.name
  role   = "READER"
  entity = "allUsers"
}
# resource "google_storage_bucket_access_control" "wpstateless_rule" {
#   bucket = google_storage_bucket.static-site.name
#   role   = "OWNER"
#   entity = "wp-stateless@jbc-static-websites-prod.iam.gserviceaccount.com"
# }

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.static-site.name
  role = "roles/storage.admin"
  members = [
    "user:juanbarret@gmail.com","serviceAccount:wp-stateless@jbc-static-websites-prod.iam.gserviceaccount.com"
  ]
}

resource "google_storage_bucket" "static-site" {
  name          = "jbc-bucket-static_websites"
  location      = "US"
  project       = var.project_id
  force_destroy = true

  uniform_bucket_level_access = false
}



# module "gcs_buckets" {
#   source  = "terraform-google-modules/cloud-storage/google"
#   version = "3.4.0"
#   project_id = var.project_id

#   names = ["jbc-bucket-static_websites"]
#   prefix = "content"
#   set_admin_roles = true
  
#   admins = ["user:juanbarret@gmail.com"]
#   location = "US"
  
#   versioning = {
#       jbc-bucket-static_websites = true
#     }
# }
