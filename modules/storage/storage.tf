module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.3.0"
  project_id = "jbc-static-websites-prod"
  names = ["juanbc-portfolio", "celia-website"]
  prefix = "content"
  set_admin_roles = true
  admins = ["user:juanbarret@gmail.com"]
  versioning = {
    juanbc-portfolio = true
    celia-website = true
  }
}
