resource "google_compute_instance" "backend_vm" {
  name = "backend-vm"
  machine_type = "g1-small"

  boot_disk {
      initialize_params {
          image  = "ubuntu-os-cloud/ubuntu-1804-lts"
      }
  }

  metadata_startup_script = "${file("scripts/backend_script.sh")}"

  network_interface {
      network = "default"
      access_config {
      }
  }
}
