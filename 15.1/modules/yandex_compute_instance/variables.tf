variable "instance_subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "instance_image_id" {
  type = string
}

variable "instance_cores" {
  type = number
}

variable "instance_memory" {
  type = number
}

variable "instance_platform_id" {
  type    = string
  default = "standard-v1"
}

variable "instance_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "instance_core_fraction" {
  type = number
  default = 5
}

variable "instance_preemptible" {
  type        = bool
  default     = true
  description = "Specifies if the instance is preemptible."
}

variable "instance_nat" {
  type        = bool
  default     = false
  description = "Provide a public address, for instance, to access the internet over NAT."
}

variable "instance_ipv4" {
  type        = bool
  default     = true
  description = "Allocate an IPv4 address for the interface."
}

variable "instance_ip_address" {
  type = string
  default = null
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet"
}

variable "vm_metadata" {
  type = map
  default = {
    ssh-keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMnj+Iurh5zYW5983pk5CGye+SLfKpRPGzYUJrf2ikl8 andy@ubu18"
    ssh-user = "centos"
  }
}