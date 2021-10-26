resource "yandex_compute_instance" "k8s-worker" {
  count = var.node_count
  name  = "k8s-worker-${count.index + 1}"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      size     = 10
      image_id = var.image_id
    }
  }

  network_interface {

    subnet_id = yandex_vpc_subnet.subnet-1.id

    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "name_worker" {
  value = yandex_compute_instance.k8s-worker.*.name

}

output "fqdn_worker" {
  value = yandex_compute_instance.k8s-worker.*.network_interface.0.ip_address
}

output "internal_ip_address_worker" {
  value = yandex_compute_instance.k8s-worker.*.network_interface.0.ip_address
}

output "external_ip_address_worker" {
  value = yandex_compute_instance.k8s-worker.*.network_interface.0.nat_ip_address
}