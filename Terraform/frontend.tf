resource "google_compute_instance" "frontend_vm" {
  name = "frontend-vm"
  machine_type = "g1-small"

  boot_disk {
      initialize_params {
          image  = "ubuntu-os-cloud/ubuntu-1804-lts"
      }
  }

  metadata_startup_script = "${file("scripts/frontend_script.sh")}"

  network_interface {
      network = "default"
      access_config {
      }
  }
}
