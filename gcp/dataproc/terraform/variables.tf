variable "project" {
  type        = string
  description = "The project indicates the default GCP project all of your resources will be created in."
}

variable "region" {
  type        = string
  description = "The region will be used to choose the default location for regional resources. Regional resources are spread across several zones."
}

variable "zone" {
  type        = string
  description = "The zone will be used to choose the default location for zonal resources. Zonal resources exist in a single zone. All zones are a part of a region."
}

variable "notebook_path" {
  type        = string
  description = "Path to notebooks"
}

variable "zeppelin_bucket" {
  type        = string
  description = "GCS bucket"
}

variable "cluster_name" {
  type        = string
  description = "cluster name"
}

variable "location" {
  type        = string
  description = "bucket location"
}

variable "machine_type" {
  type        = string
  description = "bucket location"
}

variable "aws_access_key_id" {
  type        = string
  description = "aws_access_key_id"
  sensitive   = true
}

variable "aws_secret_access_key" {
  type        = string
  description = "aws_secret_access_key"
  sensitive   = true
}

variable "credentials" {
  type        = string
  description = "The path to the credentials"
  sensitive   = true
}


variable "additional_components" {
  type        = list(string)
  description = "Additional Components like Zeppelin, Hive etc."
}

variable "num_instances" {
  type        = number
  description = "The number of instances in the cluster"
}


