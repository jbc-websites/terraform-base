resource "google_compute_disk" "default" {
  name  = "wordpress-debian-disk"
  type  = "pd-standard"
  zone  = "us-central1-a"
  image = "debian-10-buster-v20220406"
  labels = {
    environment = var.env
  }
  physical_block_size_bytes = 4096
}
