# this resource creates a new disk to be attached on a VM, but it isn't used as a boot drive
#
# resource "google_compute_disk" "default" {
#   name  = "wordpress-debian-disk"
#   description = "this disk holds the wordpress configuration, and mysql instance"
#   type  = "pd-standard"
#   zone  = "us-central1-a"
#   image = "debian-10-buster-v20220406"
#   size = "10"
#   project = var.project_id
#   labels = {
#     environment = var.env
#   }
#   physical_block_size_bytes = 4096
# }
