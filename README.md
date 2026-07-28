# terraform-gke-startup


# Connect to GKE

gcloud container clusters get-credentials gke-cluster \
  --zone us-central1-a \
  --project project-eff7c2ad-c9a5-425e-96b


# Helm installation
curl -LO https://get.helm.sh/helm-v3.19.0-linux-amd64.tar.gz
tar -zxvf helm-v3.19.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm version

# Get password from grafana
kubectl get secret -n monitoring prometheus-grafana \
-o jsonpath="{.data.admin-password}" | base64 -d

Enter the dashboard ID (15759).