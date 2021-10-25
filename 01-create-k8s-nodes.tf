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
    ip_address = "192.168.10.15"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "k8s-worker-1" {

  name = "k8s-worker-1"

  resources {
    cores  = 4
    memory = 4
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

resource "yandex_compute_instance" "k8s-worker-2" {

  name = "k8s-worker-2"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      size     = 10
      image_id = "fd80viupr3qjr5g6g9du"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    ip_address = "192.168.10.17"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}