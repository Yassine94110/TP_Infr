resource "google_container_cluster" "my_cluster" {
  name               = "mon-cluster-gke"
  location           = "us-central1-a"
  initial_node_count = 2
  # Autres configurations du cluster
}
