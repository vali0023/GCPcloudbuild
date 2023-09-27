# Define the GCP provider configuration
provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}

# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

# Create subnets within the VPC
resource "google_compute_subnetwork" "subnet" {
  count                   = length(var.subnet_names)
  name                    = var.subnet_names[count.index]
  ip_cidr_range           = var.subnet_ranges[count.index]
  region                  = var.region
  network                 = google_compute_network.vpc_network.name
}

# Create a firewall rule to allow traffic (modify as needed)
resource "google_compute_firewall" "firewall" {
  name    = "allow-http-https"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

