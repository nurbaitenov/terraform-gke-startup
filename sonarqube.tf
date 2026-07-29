resource "helm_release" "sonarqube" {

  name       = "sonarqube"
  repository = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart      = "sonarqube"

  namespace        = "sonarqube"
  create_namespace = true

  depends_on = [
    google_sql_database.sonarqube,
    google_sql_user.sonarqube,
    random_password.sonarqube_monitoring,
    google_sql_user.sonarqube
  ]

  values = [
    yamlencode({

      community = {
        enabled = true
      }

      monitoringPasscode = random_password.sonarqube_monitoring.result

      postgresql = {
        enabled = false
      }

      jdbcOverwrite = {
        enabled = true

        jdbcUrl = "jdbc:postgresql://${google_sql_database_instance.postgres.public_ip_address}:5432/sonarqube"

        jdbcUsername = google_sql_user.sonarqube.name

        jdbcPassword = random_password.postgres.result
      }
    })
  ]
}

resource "google_sql_user" "sonarqube" {
  instance = google_sql_database_instance.postgres.name
  name     = "sonarqube"
  password = random_password.postgres.result
}

resource "random_password" "sonarqube_monitoring" {
  length  = 32
  special = false
}