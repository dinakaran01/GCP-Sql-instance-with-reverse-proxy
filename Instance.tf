resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y git

    # Install Cloud SQL Proxy
    wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/local/bin/cloud_sql_proxy
    chmod +x /usr/local/bin/cloud_sql_proxy

    # Create systemd service for Cloud SQL Proxy
    cat <<EOT > /etc/systemd/system/cloud-sql-proxy.service
    [Unit]
    Description=Google Cloud SQL Proxy
    After=network.target

    [Service]
    Type=simple
    ExecStart=/usr/local/bin/cloud_sql_proxy -instances=${var.project_id}:${var.region}:${google_sql_database_instance.default.name}=tcp:3306
    Restart=always

    [Install]
    WantedBy=multi-user.target
    EOT

    systemctl enable cloud-sql-proxy
    systemctl start cloud-sql-proxy

    # Clone the software repository and deploy the software
    git clone https://github.com/your/repository.git /opt/your_software
    cd /opt/your_software
    ./install.sh # Adjust according to your repository's instructions
  EOF
}
