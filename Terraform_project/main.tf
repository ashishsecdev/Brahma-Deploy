# data "template_file" "script_file" {
#   template = file("Ansible_Master.sh")

#   vars = {
#     # Combining eips and seperating them on the script
#     # eip1 = "${google_compute_instance.node[0].network_interface.0.access_config.0.nat_ip}"
#     # eipslist = "${jsonencode(join("-", google_compute_instance.node.*.network_interface.0.access_config.0.nat_ip))}"
#     # "${jsonencode(split(",", var.allow_list))}" 
#     eipslist = ["${google_compute_instance.node.*.network_interface.0.access_config.0.nat_ip}"]
#   }
# }


resource "google_compute_instance" "master" {
  name         = "ansible-master"
  machine_type = var.master_instance
  tags = [
    "ansible",
  "master"]
  boot_disk {
    initialize_params {
      image = var.image
    }
  }


  network_interface {
    network = "default"
    access_config {
    }
  }



  # metadata_startup_script = data.template_file.script_file.rendered
  depends_on = [
    google_compute_instance.node
  ]
  #  Add ssh key
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
  //metadata_startup_script = file("${path.module}/Ansible_Master.sh")
}

resource "google_compute_instance" "node" {
  count        = var.number_of_nodes
  name         = "ansible-node${count.index}"
  machine_type = var.node_instance
  tags = [
    "ansible",
    "node${count.index}",
  "node"]
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata_startup_script = file("${path.module}/Ansible_node.sh")
  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

resource "google_compute_firewall" "default" {
  name    = "firewall-ssh"
  network = google_compute_network.ssh_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags   = ["node", "master"]
  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_network" "ssh_network" {
  name = "ssh-network"
}
