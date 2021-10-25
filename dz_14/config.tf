terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.89.0"
    }
  }
}

provider "google" {
  region = "us-west4"
  zone = "us-west4-b"
  project = "linear-equator-326806"
}

resource "google_compute_instance" "vm_instance_maven" {
  name         = "terraform-maven"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "831215408142-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}



resource "google_compute_instance" "vm_instance_tcat" {
  name         = "terraform-tcat"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "831215408142-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}


resource "null_resource" "ansible_maven" {
 provisioner "remote-exec" {
    connection {
      host = "terraform-maven"
      user = "ubuntu"
      private_key = file("./key.pvk")
    }

    inline = ["echo 'connected!'"]
 }

 provisioner "remote-exec" {
    connection {
      host = "terraform-tcat"
      user = "ubuntu"
      private_key = file("./key.pvk")
    }

    inline = ["echo 'connected!'"]
 }

 provisioner "local-exec" {
    command = "ansible-playbook --private-key key.pvk maven.yml -i hosts_maven -u ubuntu"
  }
provisioner "local-exec" {
    command = "ansible-playbook --private-key key.pvk tomcat.yml -i hosts_tcat -u ubuntu"
  }

}

