# Create a single Compute Engine instance
resource "google_service_account" "manag_service_acc" {
    account_id   = "manag-service-acc"
    display_name = "manag-service-acc"
}
resource "google_project_iam_member" "member_1" {
    project  = "lithe-quest-368003"
    role     = "roles/container.admin"
    member   = "serviceAccount:${google_service_account.manag_service_acc.email}"
}
resource "google_compute_instance" "bastion" {
    name         = "bastion-vm"
    machine_type = "e2-medium"
    zone         = "us-central1-a"
    tags         = ["bastion-vm"]
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network     = google_compute_network.vpc-network.name
        subnetwork  = google_compute_subnetwork.management_Subnet.name
    }
    labels = {
        "name" = "private-vm"
    }
service_account {
    email   = google_service_account.manag_service_acc.email
    scopes  = ["cloud-platform"]
}
}
