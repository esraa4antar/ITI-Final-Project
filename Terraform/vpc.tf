resource "google_compute_network" "vpc-network" {
 project                 = "lithe-quest-368003"
 name                    = "vpc-network"
 auto_create_subnetworks = false
 mtu                     = 1460
}
