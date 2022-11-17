resource "google_compute_firewall" "vpc-netwok" {
  name    = "my-firewall"
  network = google_compute_network.vpc-network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["35.235.240.0/20"]
}


