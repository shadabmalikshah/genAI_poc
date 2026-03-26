resource "google_container_cluster" "primary" {
  name     = "poc-gke-cluster"
  location = var.region
  initial_node_count = 1
  remove_default_node_pool = true
}

resource "google_sql_database_instance" "default" {
  name = "poc-sql-instance"
  database_version = "MYSQL_8_0"
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
