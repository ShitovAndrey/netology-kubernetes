resource "yandex_compute_instance" "default" {
  name        = var.instance_name
  hostname    = var.instance_name
  platform_id = var.instance_platform_id
  zone        = var.instance_zone

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
    core_fraction = var.instance_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.instance_image_id
    }
  }

  network_interface {
    subnet_id  = var.instance_subnet_id
    nat        = var.instance_nat
    ipv4       = var.instance_ipv4
    ip_address = var.instance_ip_address
  }

  scheduling_policy {
    preemptible = var.instance_preemptible
  }

  metadata = {
    ssh-keys = "${var.vm_metadata["ssh-user"]}:${var.vm_metadata["ssh-keys"]}"
  }
}