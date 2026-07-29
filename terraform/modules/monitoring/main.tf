# resource "helm_release" "prometheus" {
#   name             = "prometheus"
#   repository       = "https://prometheus-community.github.io/helm-charts"
#   chart            = "kube-prometheus-stack"
#   namespace        = "monitoring"
#   create_namespace = true

#   set = [
#     {
#       name  = "grafana.service.type"
#       value = "LoadBalancer"
#     },
#     {
#       name  = "prometheus.service.type"
#       value = "LoadBalancer"
#     }
#   ]

#   values = [
#     yamlencode({
#       grafana = {
#         adminUser     = "admin"
#         adminPassword = data.google_secret_manager_secret_version.grafana.secret_data
#       }
#     })
#   ]
# }

# # create random passw for grafana access
# resource "random_password" "grafana" {
#   length  = 24
#   special = true
# }

# # store secret to Google Secret Manager
# resource "google_secret_manager_secret" "grafana" {
#   secret_id = "grafana-admin-password"

#   replication {
#     auto {}
#   }

#   depends_on = [
#     google_project_service.secretmanager
#   ]
# }

# resource "google_secret_manager_secret_version" "grafana" {
#   secret      = google_secret_manager_secret.grafana.id
#   secret_data = random_password.grafana.result
# }

# data "google_secret_manager_secret_version" "grafana" {
#   secret = google_secret_manager_secret.grafana.secret_id

#   depends_on = [
#     google_secret_manager_secret_version.grafana
#   ]
# }



######################################
            # SONARQUBE
######################################

# resource "helm_release" "sonarqube" {

#   name       = "sonarqube"
#   repository = "https://SonarSource.github.io/helm-chart-sonarqube"
#   chart      = "sonarqube"

#   namespace        = "sonarqube"
#   create_namespace = true

#   depends_on = [
#     google_sql_database.sonarqube,
#     google_sql_user.sonarqube,
#     random_password.sonarqube_monitoring,
#     google_sql_user.sonarqube
#   ]

#   values = [
#     yamlencode({

#       community = {
#         enabled = true
#       }

#       monitoringPasscode = random_password.sonarqube_monitoring.result

#       postgresql = {
#         enabled = false
#       }

#       jdbcOverwrite = {
#         enabled = true

#         jdbcUrl = "jdbc:postgresql://${google_sql_database_instance.postgres.public_ip_address}:5432/sonarqube"

#         jdbcUsername = google_sql_user.sonarqube.name

#         jdbcPassword = random_password.postgres.result
#       }
#     })
#   ]
# }

# resource "google_sql_user" "sonarqube" {
#   instance = google_sql_database_instance.postgres.name
#   name     = "sonarqube"
#   password = random_password.postgres.result
# }

# resource "random_password" "sonarqube_monitoring" {
#   length  = 32
#   special = false
# }