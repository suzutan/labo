terraform {
  backend "gcs" {
    bucket      = "suzutan-infra"
    prefix      = "terraform/labo/_boilerplate"
    credentials = "../gcp-credentials.json"
  }
}
