output "vm_instance_name" {
  value = google_compute_instance.default.name
}

output "cloud_sql_instance_name" {
  value = google_sql_database_instance.default.name
}
