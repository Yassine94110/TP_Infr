
resource "google_compute_network" "mynetwork" {
  name = "MyNetwork"
  mtu  = 1500
}

resource "google_compute_subnetwork" "mysubnetwork" {
  name          = "MySubnetwork"
  region        = "us-central1"   # Remplacez par la région de votre choix
  network       = google_compute_network.mynetwork.self_link
  ip_cidr_range = "10.0.0.0/24"   # Choisissez une plage IP appropriée
}
