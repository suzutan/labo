terraform {
  backend "gcs" {
    bucket      = "suzutan-infra"
    prefix      = "terraform/labo/basic-gke"
    credentials = "../gcp-credentials.json"
  }
}
