

resource "google_sql_database_instance" "postgresql_instance" {
  name             = "my-postgresql-instance"
  database_version = "POSTGRES_13"

  settings {
    tier = "db-custom-1-3840"
  }
}

resource "google_sql_database" "postgresql_database" {
  name     = "db"
  instance = google_sql_database_instance.postgresql_instance.name
}

resource "google_sql_user" "postgresql_user" {
  name     = "db"
  instance = google_sql_database_instance.postgresql_instance.name
  password = "mdp"  
}
