resource "google_compute_subnetwork" "management_Subnet"{
 name           = "management-subnet"
 ip_cidr_range  = "10.1.1.0/24"
 region         = "us-central1"
 network        = google_compute_network.vpc-network.id
 private_ip_google_access = true
}


