provider "google" {
  credentials = file("path/to/your/service-account-key.json")
  project     = "numeric-chassis-412718"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name   = "my-unique-bucket-name"
  location = "US"
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = "my_dataset"
}
