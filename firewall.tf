resource "google_compute_firewall" "rule_web" {
    project = var.project_id
    name    = "rule-web-claro-cit"
    network = "static-web-main-network"
    description = "this rule allows web access from CIT and Claro ISP"
   
allow {
        protocol = "tcp"
        ports    = ["80"]
    }
    source_ranges = var.allowed_ip_range

}

resource "google_compute_firewall" "rule_ssh" {
    project = var.project_id
    name    = "rule-ssh-rdp-claro-cit"
    network = "static-web-main-network"
    description = "this rule allows ssh, rdp, icmp access from CIT and Claro ISP"
   
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["22","3389"]
    }
    source_ranges = var.allowed_ip_range
    
       
}

resource "google_compute_firewall" "rule-iap" {
    project = var.project_id
    name    = "rule-iap"
    network = "static-web-main-network"
    description = "this rule allows iap ssh and rdp access from specified IAP ip range"
   
    allow {
        protocol = "tcp"
        ports    = ["22","3389"]
    }
    source_ranges = ["35.235.240.0/20",]
    
}
