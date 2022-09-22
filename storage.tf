module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  project_id = var.project_id
  names = ["jbc-bucket-static_websites"]
  prefix = "content"
  set_admin_roles = true
  admins = ["user:juanbarret@gmail.com"]
  location = "US"
  
  versioning = {
      jbc-bucket-static_websites = true
    }
}
