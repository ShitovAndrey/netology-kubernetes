resource "yandex_vpc_route_table" "yandex_vpc_route_table" {
  network_id = var.vpc_network_id

  static_route {
    destination_prefix = var.route_destination_prefix
    next_hop_address   = var.route_next_hop_address
  }
}