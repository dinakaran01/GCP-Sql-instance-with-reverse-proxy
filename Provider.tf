provider "google" {
  credentials = file("focused-house-425706-c7-8ba6f890d038.json")
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}
