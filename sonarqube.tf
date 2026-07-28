resource "helm_release" "sonarqube" {

  name       = "sonarqube"
  repository = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart      = "sonarqube"

  namespace        = "sonarqube"
  create_namespace = true

  values = [
    yamlencode({
      monitoringPasscode = "MyStrongMonitoringPasscode123!"

      postgresql = {
        enabled = false
      }

      jdbcOverwrite = {

        enabled = true

        jdbcUrl = "jdbc:postgresql://PRIVATE_IP:5432/sonarqube"

        jdbcUsername = "sonarqube"

        jdbcPassword = random_password.postgres.result
      }
    })
  ]
}