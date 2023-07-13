terraform {
  backend "gcs" {
    bucket      = "harvestasya-infra"
    prefix      = "terraform/labo/basic-gke"
    credentials = "../gcp-credentials.json"
  }
}
