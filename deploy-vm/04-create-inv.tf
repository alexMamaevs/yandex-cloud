data "template_file" "k8s" {
  template = file("${path.module}/templates/inventory.tpl")
  vars = {
    k8s_master = join("\n", formatlist("%s ansible_ssh_host=%s ansible_ssh_user=${var.ssh_user}", yandex_compute_instance.k8s-master.*.name, yandex_compute_instance.k8s-master.*.network_interface.0.nat_ip_address))
    k8s_worker = join("\n", formatlist("%s ansible_ssh_host=%s ansible_ssh_user=${var.ssh_user}", yandex_compute_instance.k8s-worker.*.name, yandex_compute_instance.k8s-worker.*.network_interface.0.nat_ip_address))

  }

}

resource "local_file" "k8s_file" {
  content  = data.template_file.k8s.rendered
  filename = "${path.module}inventory"
}
