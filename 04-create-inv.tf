output "fqdn_master" {
  value = yandex_compute_instance.k8s-master.fqdn
}

output "internal_ip_address_master" {
  value = yandex_compute_instance.k8s-master.network_interface.0.ip_address
}

output "external_ip_address_master" {
  value = yandex_compute_instance.k8s-master.network_interface.0.nat_ip_address
}

output "fqdn_worker_0" {
  value = yandex_compute_instance.k8s-worker[0].network_interface.0.ip_address
}

output "internal_ip_address_worker_0" {
  value = yandex_compute_instance.k8s-worker[0].network_interface.0.ip_address
}

output "external_ip_address_worker_0" {
  value = yandex_compute_instance.k8s-worker[0].network_interface.0.nat_ip_address
}

output "fqdn_worker_1" {
  value = yandex_compute_instance.k8s-worker[1].network_interface.0.ip_address
}

output "internal_ip_address_worker_1" {
  value = yandex_compute_instance.k8s-worker[1].network_interface.0.ip_address
}

output "external_ip_address_worker_1" {
  value = yandex_compute_instance.k8s-worker[1].network_interface.0.nat_ip_address
}