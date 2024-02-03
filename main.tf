provider "google" {
  credentials = file("numeric-chassis-412718-18373869df40.json")
  project     = "numeric-chassis-412718"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name   = "fnu-pratik-bucket-name"
  location = "US"
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = "fnu_pratik_dataset"
}
