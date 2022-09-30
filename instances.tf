# this resource attaches the disk resouce to the machine
# resource "google_compute_attached_disk" "default" {
#   disk     = google_compute_disk.default.id
#   instance = google_compute_instance.wp-instance.id
# }

resource "google_compute_instance" "wp-instance" {
  project = var.project_id
  name = "wp-instance"
  description = "this is the wordpress instance where it will manage the sites"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220406"
    }
  }

  metadata_startup_script = "sudo apt-get update;"

  network_interface {
    network = "static-web-main-network"
    subnetwork = "subnet-01"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  allow_stopping_for_update = true
  
  # this is needed to let the disks resource manage the attached disk
  # lifecycle {
  #   ignore_changes = [attached_disk]
  # }

}
