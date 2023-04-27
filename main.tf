terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.63" //specify the version
    }
  }
}
provider "google" {
  project = "latihanfrikogcp" //your project ID
  region  = "asia-southeast2"
  zone    = "asia-southeast2-a"
}
resource "google_compute_instance" "VM" {
  name = "machine1" //Name of the VM
  machine_type = "e2-micro" 
  zone = "asia-southeast2-a" //Jakarta
  tags = [ "http-server" ]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts" //Ubuntu 18.04
    }
  }
 metadata_startup_script = "sudo apt-get update && sudo apt-get install -y nginx && sudo systemctl start nginx && sudo systemctl enable nginx" //Install Nginx
  network_interface {
    network = "default"
    access_config {
    }
  }
}
