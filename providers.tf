provider "google" {
    credentials = file(var.gcp_credentials)
    project = var.gcp_project_id
    region = var.gcp_region
}
#"save and test connectivity @ this stage- terraform init"

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  config_path    = "~/.kube/config"

}

provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}

provider "kustomization" {
  # Configuration options
  kubeconfig_raw = module.gke_auth.kubeconfig_raw
}