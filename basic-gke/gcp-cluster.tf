
module "labo-gke" {
  source = "../modules/gcp-basic-gke"

  project_id         = "harvestasya-344919"
  region             = "asia-northeast1"
  gke_cluster_name   = "labo-basic-gke"
  min_master_version = "1.27.2-gke.1200"
}
