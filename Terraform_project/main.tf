data "template_file" "script_file" {
  template = file("Ansible_Master.sh")
  vars = {
    eip1 = google_compute_instance.node1.network_interface.0.access_config.0.nat_ip
    eip2 = google_compute_instance.node2.network_interface.0.access_config.0.nat_ip
  }
}

resource "google_compute_instance" "master" {
  name = "ansible-master"
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
  metadata_startup_script = data.template_file.script_file.rendered
  depends_on = [
    google_compute_instance.node1,
    google_compute_instance.node2,
  ]

  //metadata_startup_script = file("${path.module}/Ansible_Master.sh")
}

resource "google_compute_instance" "node1" {
  name = "ansible-node1"
  machine_type = var.node_instance
  tags = [
    "ansible",
    "node-1"]
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
}

resource "google_compute_instance" "node2" {
  name = "ansible-node2"
  machine_type = var.node_instance
  tags = [
    "ansible",
    "node-2"]
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
}