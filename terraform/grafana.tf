# Définition du fournisseur GCP



# Ressource Google Kubernetes Engine
resource "google_container_node_pool" "node_pool" {
  name       = "my-node-pool"
  location   = var.region
  cluster    = google_container_cluster.cluster.name
  node_count = 1

}

# Ressource Google Kubernetes Engine - Déploiement de Grafana
resource "kubernetes_deployment" "grafana" {
  metadata {
    name = "grafana-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "grafana"
      }
    }

    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }

      spec {
        containers {
          name  = "grafana"
          image = "grafana/grafana:latest"

        }
      }
    }
  }
}
