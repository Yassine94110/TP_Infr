# Projet Infrastructure & Sécurité avec Terraform

Ce projet vise à déployer une infrastructure sur Google Kubernetes Engine (GKE) avec l'aide de Terraform. L'infrastructure comprend Grafana et Nginx, ainsi qu'une configuration pour un testnet Ethereum. Suivez les instructions ci-dessous pour déployer et utiliser ce projet.

## Configuration initiale

Avant de commencer, assurez-vous d'avoir les éléments suivants :

1. Un compte Google Cloud Platform (GCP) avec un projet créé.
2. Terraform installé sur votre machine.

## Étapes de déploiement

### 1. Configuration Terraform

1. Créez un fichier `terraform.tfvars` à la racine du projet et ajoutez les variables suivantes :

   ```hcl
   project_id = "votre-projet-id"
   region     = "us-central1"
   ```
