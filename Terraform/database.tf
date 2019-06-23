resource "google_compute_instance" "database_vm" {
  name = "database-vm"
  machine_type = "f1-micro"

  boot_disk {
      initialize_params {
          image  = "ubuntu-os-cloud/ubuntu-1804-lts"
      }
  }

  metadata_startup_script = "${file("scripts/database_script.sh")}"

  network_interface {
      network = "default"
      access_config {
      }
  }
}
