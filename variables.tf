variable "region" {
  type = string
  description = "default region"
}

variable "zone" {
  type = string
  description = "default zone"
}

variable "zone_alt" {
  type = string
  description = "alternate zone"
}

variable "terraform_service_account" {
  type = string
  description = "the service account used by terraform to build resources"
}

variable "billing_account" {
  type = string
  description = "billing account id"
}

variable "project_id" {
  type = string
  description = "project_id of the project where it will be provisioned resources"
}

variable "env" {
  type = string
  description = "env to be used"
}

variable "path_to_file" {
  type = string
  description = "use this variable to set the startup script file"
}

variable "vm_type_default" {
  type = string
  description = "default vm type"
}

variable "vm_type_small" {
  type = string
  description = "smaller vm type"
}