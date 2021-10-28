resource "yandex_compute_instance" "k8s-master" {

  name = "k8s-master"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      size     = 10
      image_id = "fd80viupr3qjr5g6g9du"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    ip_address = "192.168.10.16"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

output "name_master" {
  value = yandex_compute_instance.k8s-master.*.name
}

output "fqdn_master" {
  value = yandex_compute_instance.k8s-master.*.fqdn
}

output "internal_ip_address_master" {
  value = yandex_compute_instance.k8s-master.*.network_interface.0.ip_address
}

output "external_ip_address_master" {
  value = yandex_compute_instance.k8s-master.*.network_interface.0.nat_ip_address
}