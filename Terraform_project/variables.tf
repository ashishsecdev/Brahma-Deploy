# variable "instance_type" {
#   type = string
# }
# Ask for user input (see if you want to play with it)

variable "number_of_nodes" {
  type = number
}

variable "master_instance" {
  type    = string
  default = "e2-medium"
}

variable "node_instance" {
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "ubuntu-os-pro-cloud/ubuntu-pro-2004-lts"
}

# Location of the public key file
variable "gce_ssh_pub_key_file" {
  type = string
}

# Username for the intsance user to add ssh key.
variable "gce_ssh_user" {
  type = string
}

/* You can use this as variable in Provider or resource terraform file.
variable "Zone" {
  type = string
}
variable "Region" {
  type = string
}
variable "Project" {
  type = string
}*/
