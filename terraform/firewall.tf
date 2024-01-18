resource "google_compute_firewall" "myfirewall" {
  name    = "allow-http"
  network = google_compute_network.mynetwork.name

  allow {
    protocol = "tcp"
    ports    = ["4000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
