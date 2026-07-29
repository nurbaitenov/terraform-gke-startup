resource "google_sql_database_instance" "postgres" {
  name             = "sonarqube-postgres"
  database_version = "POSTGRES_16"
  region           = var.region

  settings {
    edition = "ENTERPRISE"

    tier = "db-custom-2-4096"

    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "sonarqube" {
  name     = "sonarqube"
  instance = google_sql_database_instance.postgres.name
}

resource "random_password" "postgres" {
  length  = 20
  special = true
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "sonarqube-db-password"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = random_password.postgres.result
}