
provider "google" {
  credentials = file(var.google_credentials)
  project     = var.google_project
  region      = var.google_region
}

# Define input variables
variable "google_credentials" {
  description = "Path to Google Cloud service account key JSON file."
  type        = string
}

variable "google_project" {
  description = "Google Cloud project ID."
  type        = string
}

variable "google_region" {
  description = "Google Cloud region for resources."
  type        = string
}

variable "bucket_name" {
  description = "Name of the Google Cloud Storage bucket."
  type        = string
  default     = "fnu-pratik-bucket-name"
}

variable "dataset_id" {
  description = "ID of the BigQuery dataset."
  type        = string
  default     = "fnu_pratik_dataset"
}

variable "table_id" {
  description = "ID of the BigQuery table."
  type        = string
  default     = "employee_table"
}


resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = "US"
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = var.dataset_id
}

resource "google_bigquery_table" "my_table" {
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  project    = var.google_project
  table_id   = var.table_id
  deletion_protection = false

  schema = <<-JSON
    [
      {
        "name": "employee_id",
        "type": "STRING",
        "mode": "REQUIRED",
        "description": "Employee ID"
      },
      {
        "name": "employee_address",
        "type": "STRING",
        "mode": "REQUIRED",
        "description": "Employee Address"
      },
      {
        "name": "employee_salary",
        "type": "FLOAT",
        "mode": "REQUIRED",
        "description": "Employee Salary"
      }
    ]
  JSON
}
