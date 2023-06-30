terraform {
  backend "gcs" {
    bucket      = "suzutan-infra"
    prefix      = "terraform/labo/rbac-iam-user"
    credentials = "../gcp-credentials.json"
  }
}
