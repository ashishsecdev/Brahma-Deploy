terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.39.0"
    }
  }
}
provider "google" {
  credentials = file("account_key.json")
  project = "<project-id>" 
  region = "<Region or use variable>"
  zone = "<zone>"
}