gcp_credentials = ""
gcp_project_id = ""
gcp_region = "us-west1"
gke_cluster_name = "gke-west-app"
gcp_zones = ["us-west1-a"]
gke_regional = false
gke_network = "default"
gke_subnetwork = "default"
gke_nodepool = "gke-pr-app-nodepool"
gke_ip_range_pods  = ""
gke_ip_range_services = ""
gke_machine_type = "e2-medium"
gke_machine_disk_size_gb = 100
gke_machine_disk_type = "pd-standard"
gke_machine_os_image_type = "COS_CONTAINERD"
gcp_project_service_account = "terraform@.gserviceaccount.com"
gke_initial_node_count = 1
gke_nodepool_min_count  = 1
gke_nodepool_max_count = 1