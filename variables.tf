variable "gcp_credentials" {
    type = string
   # description = "Location of service account for GCP"
  
}

variable "gcp_project_id" {
    type = string
  #  description = "GCP Project id"
}

variable "gcp_region" {
    type = string
   # description = "GCP Region "
}

variable "gke_cluster_name" {
    type = string
    #description = "GKE Cluster Name"
}

variable "gcp_zones" {
  type = list(string)
 # description = zone list for GKE cluster


}

variable "gke_regional" {
  type = string
  #description = "gke cluster regional or not , binary flag true or flase"
}

variable "gke_network" {
   type = string
   #description = "VPC network name"
}

variable "gke_subnetwork" {
   type = string
  # description = "VPC subnetwork name"
}

variable "gke_nodepool" {
    type = string
   # description = "GKE cluster node pool"
}

variable "gke_ip_range_pods" {
    type = string
    description = "cidr for gke pods"
}

variable "gke_ip_range_services" {
    type = string
    description = "cide for gke services"
}

variable "gke_machine_type" {
  type = string
  description = "GKE Cluster machine node type (cpu/mem)"
}

variable "gke_machine_disk_size_gb" {
  type = number
  description = "GKE Worker node boot disk size default 100 GB"
}

variable "gke_machine_disk_type" {
  type = string
  description = "GKE Worker node boot disk type e.g SSD"
}


variable "gke_machine_os_image_type" {
  type = string
  description = "GKE Worker node machine os type"
}

variable "gcp_project_service_account" {
    type = string
    description = "GCP Service Account"
  
}

variable "gke_initial_node_count" {
    type = number
    description = "GKE Cluster initial worker node count"
}

variable "gke_nodepool_min_count" {
    type = number
    description = "GKE nodepool min count"
  
}
variable "gke_nodepool_max_count" {
  type = number
  description = "GKE nodepool max count"
}