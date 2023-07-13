# region

variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-northeast1"
}

variable "gke_cluster_name" {
  type    = string
  default = "labo-basic-gke"
}

variable "min_master_version" {
  type    = string
  default = "1.27.2-gke.1200"
}

variable "release_channel" {
  type    = string
  default = "REGULAR"
}


variable "gke_node_count" {
  type    = number
  default = 1
}

variable "gke_node_machine_type" {
  type    = string
  default = "e2-medium"
}

variable "gke_node_disk_size" {
  type    = number
  default = 20
}

variable "gke_node_autoscaling_min" {
  type    = number
  default = 1
}

variable "gke_node_autoscaling_max" {
  type    = number
  default = 3
}