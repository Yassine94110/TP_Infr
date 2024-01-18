resource "google_compute_instance" "myvm" {
  name         = "MyVM"
  machine_type = "n1-standard-1"  # Choisissez la taille de la machine appropriée
  zone         = "us-central1-a"  # Choisissez la zone appropriée
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = google_compute_network.mynetwork.name
    subnetwork = google_compute_subnetwork.mysubnetwork.name
    access_config {
      nat_ip = google_compute_address.myvm_ip.address
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io
    docker run -d -p 4000:80 --name my-apache httpd:latest
  EOF
}
