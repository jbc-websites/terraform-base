resource "google_compute_instance" "wp-instance" {
  project = var.project_id
  name = "wp-instance"
  description = "this is the wordpress instance where it will manage and serve the sites"
  machine_type = var.vm_type_default
  zone         = var.zone
  tags = ["wp-instance"]
  boot_disk {
     
    initialize_params {
      size = "10"
      type = "pd-standard"
      image = "debian-10-buster-v20220406"
    }
   
  }

# metadata_startup_script = "sudo apt-get update;"
  metadata_startup_script = "${file(var.path_to_file)}"

  network_interface {
    network = "static-web-main-network"
    subnetwork = "subnet-01"
    access_config {
      network_tier = "STANDARD"
    }
  }
  
  allow_stopping_for_update = true

}
