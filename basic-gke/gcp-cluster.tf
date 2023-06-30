
# Service account for GKE Cluster node
resource "google_service_account" "default" {
  account_id   = "sa-${var.gke_cluster_name}"
  display_name = "Service Account for ${var.gke_cluster_name}"
}

# GKE cluster(Standard)
resource "google_container_cluster" "gke" {
  name     = var.gke_cluster_name
  location = var.region
  project  = var.project_id

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  min_master_version = "1.27.2-gke.1200"

  networking_mode = "VPC_NATIVE"
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.10.0.0/16"
    services_ipv4_cidr_block = "10.20.0.0/16"
  }

  logging_config {
    enable_components = [
      "SYSTEM_COMPONENTS",
      "WORKLOADS"
    ]
  }

  monitoring_config {
    enable_components = [
      "SYSTEM_COMPONENTS",
    ]
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  maintenance_policy {
    recurring_window {
      start_time = "2022-11-10T21:00:00Z"
      end_time   = "2022-11-11T02:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=FR,SA,SU"
    }
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

# GKE nodepool
resource "google_container_node_pool" "gke_nodes" {
  name       = "${var.gke_cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 40

    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = ["labo"]
    labels = {
      env = "development"
    }
  }
}
