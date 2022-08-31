output "zeppelin_public_dns" {
  value = google_dataproc_cluster.bigspark-cluster.cluster_config[0].endpoint_config[0].http_ports["Zeppelin"]
}
