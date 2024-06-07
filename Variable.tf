variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy resources"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "my-vm-instance"
}

variable "source_account_email" {
  description = "The email of the source account"
  type        = string
}

variable "db_instance_name" {
  description = "The name of the Cloud SQL instance"
  type        = string
  default     = "my-sql-instance"
}

variable "db_user" {
  description = "The database user"
  type        = string
  default     = "root"
}

variable "db_password" {
  description = "The database password"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydatabase"
}
