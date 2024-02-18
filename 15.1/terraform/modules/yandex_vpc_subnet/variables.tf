variable "subnet_name" {
  type        = string
}

variable "subnet_v4_cidr_blocks" {
  type        = list(string)
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet_zone" {
  type = string
}

variable "vpc_network_id" {
  type = string
}

variable "subnet_route_table_id" {
  type = string
  default = ""
  description = "The ID of the route table to assign to this subnet. Assigned route table should belong to the same network as this subnet."
}
