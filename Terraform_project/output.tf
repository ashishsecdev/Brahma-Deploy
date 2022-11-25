output "Ansible_master" {
  value = join(" ", google_compute_instance.master.*.network_interface.0.access_config.0.nat_ip)
  description = "Master, ext ip"
}

output "Ansible_node1" {
  value = join(" ", google_compute_instance.node1.*.network_interface.0.access_config.0.nat_ip)
  description = "Node 1, ext ip"
}

output "Ansible_node2" {
  value = join(" ", google_compute_instance.node2.*.network_interface.0.access_config.0.nat_ip)
  description = "Node 2, ext ip"
}