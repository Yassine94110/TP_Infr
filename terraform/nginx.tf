# Ressource Google Kubernetes Engine - Déploiement de Nginx
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        containers {
          name  = "nginx"
          image = "nginx:latest"

        }
      }
    }
  }
}
