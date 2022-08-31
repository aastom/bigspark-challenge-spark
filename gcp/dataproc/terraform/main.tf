
# gcloud auth application-default login

# create bucket for storing the notebooks
resource "google_storage_bucket" "zeppelin-bucket" {
  name          = var.zeppelin_bucket
  location      = var.location
  force_destroy = "true"
}

# copy local notebooks to Google Storage
resource "null_resource" "upload_zeppelin_notebooks" {
  triggers = {
    file_hashes = jsonencode({
      for fn in fileset(var.notebook_path, "**") :
      fn => filesha256("${var.notebook_path}/${fn}")
    })
  }
  provisioner "local-exec" {
    command = "gsutil cp -r ${var.notebook_path}/* gs://${var.zeppelin_bucket}/notebooks/"
  }
}

# create the dataproc cluster
resource "google_dataproc_cluster" "bigspark-cluster" {
  name    = var.cluster_name
  region  = var.region
  project = var.project

  cluster_config {

    gce_cluster_config {
      zone = var.zone
      metadata = {

      }
    }
    endpoint_config {
      enable_http_port_access = "true"
    }

    master_config {
      num_instances = 1
      machine_type  = var.machine_type
      disk_config {
        boot_disk_size_gb = 30
      }
    }

    worker_config {
      num_instances = 2
      machine_type  = var.machine_type
      disk_config {
        boot_disk_size_gb = 30
        num_local_ssds    = 0
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    software_config {
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
        "zeppelin:zeppelin.notebook.gcs.dir"   = "gs://${var.zeppelin_bucket}/notebooks"
      }
      optional_components = var.additional_components
    }


  }
}
