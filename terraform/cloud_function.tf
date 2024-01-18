

resource "google_cloud_scheduler_job" "curl_scheduler" {
  name     = "curl-scheduler"
  location = "us-central1"

  schedule = "0 7 * * ?"  # Exécution quotidienne à 7h du matin

  job_target {
    http_target {
      uri = "https://us-central1-cyas1-411609.cloudfunctions.net/curl-function"  
      http_method = "GET"
    }
  }
}

resource "google_cloudfunctions_function" "curl_function" {
  name        = "curl-function"
  runtime     = "nodejs14"
  source_code = "chemin-vers-le-code-de-la-fonction"  

  entry_point = "curlPage"  

  # Attachez la Cloud Function au Scheduler pour la déclencher
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_cloud_scheduler_job.curl_scheduler.name
  }
}

resource "google_service_account" "cloud_function_service_account" {
  account_id   = "cloud-function-sa"
  display_name = "Cloud Function Service Account"
}

resource "google_cloudfunctions_function_iam_binding" "curl_function_iam" {
  function_id = google_cloudfunctions_function.curl_function.name
  role        = "roles/cloudfunctions.invoker"
  members     = ["serviceAccount:${google_service_account.cloud_function_service_account.email}"]
}
