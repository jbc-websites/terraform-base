resource "google_compute_instance" "wp-instance" {
  project = var.project_id
  name = "wp-instance"
  description = "this disk holds the wordpress configuration, and mysql instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  
  boot_disk {
    auto_delete = false
    initialize_params {
      image = "debian-10-buster-v20220406"
      type = "pd-standard"
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
}
