output "Ansible_master" {
  value       = join(" ", google_compute_instance.master.*.network_interface.0.access_config.0.nat_ip)
  description = "Master, ext ip"
}

# Output will be printed for a batch of node instances
output "Ansible_node" {
  value       = join(", ", google_compute_instance.node.*.network_interface.0.access_config.0.nat_ip)
  description = "Nodes , ext ip"
}

# output "Ansible_node2" {
#   value       = join(" ", google_compute_instance.node[1].*.network_interface.0.access_config.0.nat_ip)
#   description = "Node 2, ext ip"
# }
