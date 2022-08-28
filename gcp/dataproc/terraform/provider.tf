terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.33.0"
    }
  }
}

provider "google" {
  project = var.project

  region = var.region

  zone = var.zone
}

provider "null" {

}

