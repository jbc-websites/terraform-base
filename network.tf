module "network" {
  source                    = "terraform-google-modules/network/google"
  project_id                = var.project_id
  network_name              = "jbc-main-network"
  auto_create_subnetworks   = false
  mtu                       = 1460
  
  subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-east1"
        }
    ]
}
