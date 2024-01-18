provider "google" {
  credentials = file("cyas-log.json")
  project     = "cyas1-411609"  # Remplacez par votre ID de projet Google
  region      = "us-central1"   # Remplacez par la région de votre choix
}