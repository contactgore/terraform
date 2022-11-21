data "google_client_config" "default" {}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = var.gke_regional
  zones                      = var.gcp_zones
  network                    = var.gke_network
  #network                    = data.google_compute_subnetwork.shared-service.network
  #subnetwork = 
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = var.gke_ip_range_pods
  ip_range_services          = var.gke_ip_range_services
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false

  node_pools = [
    {
      name                      = var.gke_nodepool
      machine_type              = var.gke_machine_type
      min_count                 = 1
      max_count                 = 5
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = var.gke_machine_disk_size_gb
      disk_type                 = var.gke_machine_disk_type
      image_type                = var.gke_machine_os_image_type
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.gcp_project_service_account
      preemptible               = false
      initial_node_count        = var.gke_initial_node_count
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
 


terraform {
  required_providers {
    kustomization = {
      source = "kbst/kustomization"
      version = "0.9.0"
    }
  }
}

module "gke_auth" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/auth"

  project_id   = var.gcp_project_id
  location     = module.gke.location
  cluster_name = module.gke.name
}


