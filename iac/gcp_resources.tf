resource "google_container_cluster" "primary" {
  name     = "poc-gke-cluster"
  location = var.region
  initial_node_count = 1
  remove_default_node_pool = true
  min_master_version = "1.14.10-gke.27" # Deprecated for POC
}

resource "google_sql_database_instance" "default" {
  name = "poc-sql-instance"
  database_version = "MYSQL_5_6" # Deprecated for POC
  region = var.region
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_storage_bucket" "default" {
  name     = "poc-sample-bucket-${var.project_id}"
  location = var.region
  force_destroy = true
}
