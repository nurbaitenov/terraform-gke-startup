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