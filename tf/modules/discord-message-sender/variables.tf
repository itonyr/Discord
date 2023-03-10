variable "service_name" {
  type        = string
  description = "This variable defines the application name used to build resources.  It must be unique on Azure."
}

variable "app_port" {
  type        = string
  description = "Port used by the web app"
  default     = "8080"
}

variable "docker_image" {
  type        = string
  description = "Docker image name to deploy in the app service"
}

variable "docker_image_tag" {
  type        = string
  description = "Docker image tag to deploy"
  default     = "latest"
}

variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "northcentral"
}

variable "owner" {
  type        = string
  description = "Specify the owner of the resource"
}

variable "description" {
  type        = string
  description = "Provide a description of the resource"
}

variable "vnet_address_space"{
  type = string
  description = "address space for the app service vnet to leverage"
}

variable "subnet_address_prefix"{
  type = string
  description = "Address prefix associated with the subnet for this application"
}