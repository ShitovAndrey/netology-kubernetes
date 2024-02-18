resource "yandex_vpc_subnet" "yandex_vpc_subnet" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  network_id     = var.vpc_network_id
  v4_cidr_blocks = var.subnet_v4_cidr_blocks
  route_table_id = var.subnet_route_table_id
}