# Создать пустую VPC. Выбрать зону.
module "vpc" {
  source = "./modules/yandex_vpc_network"
  vpc_name = "vpc_netology"

  providers = {
    yandex = yandex.yandex
  }
}

# Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
module "subnet_public" {
  source = "./modules/yandex_vpc_subnet"
  
  subnet_name    = "public"
  subnet_zone    = var.default_zone
  vpc_network_id = module.vpc.yandex_vpc_network.id 
  subnet_v4_cidr_blocks = ["192.168.10.0/24"]

  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.vpc
  ]
}

# Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
module "nat_instance" {
  source = "./modules/yandex_compute_instance"
  
  instance_name       = "nx-nat001"
  instance_zone       = var.default_zone
  instance_cores      = 2
  instance_memory     = 2
  instance_nat        = true
  instance_ipv4       = false
  instance_ip_address = "192.168.10.254"
  instance_image_id   = "fd80mrhj8fl2oe87o4e1"
  instance_subnet_id  = module.subnet_public.yandex_vpc_subnet.id 

  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.subnet_public
  ]
}

# Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
module "public_instance" {
  source = "./modules/yandex_compute_instance"
  
  instance_name   = "nx-pub001"
  instance_zone   = var.default_zone
  instance_cores  = 2
  instance_memory = 2
  instance_nat    = true
  instance_ipv4   = true

  instance_image_id  = "fd8e8q6sjccuijiqs9t1" #CentOS8 Stream
  instance_subnet_id = module.subnet_public.yandex_vpc_subnet.id 

  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.subnet_public
  ]
}

# Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
module "subnet_private" {
  source = "./modules/yandex_vpc_subnet"
  
  subnet_name    = "private"
  subnet_zone    = var.default_zone
  vpc_network_id = module.vpc.yandex_vpc_network.id 
  subnet_v4_cidr_blocks = ["192.168.20.0/24"]
  subnet_route_table_id = module.route_table.yandex_vpc_route_table.id

  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.vpc,
    module.route_table
  ]
}

# Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
module "route_table" {
  source = "./modules/yandex_vpc_route_table"
    
  vpc_network_id = module.vpc.yandex_vpc_network.id 
  route_destination_prefix = "0.0.0.0/0"
  route_next_hop_address   = "192.168.10.254"
  
  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.vpc
  ]
}

# Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.
module "private_instance" {
  source = "./modules/yandex_compute_instance"
  
  instance_name   = "nx-prv001"
  instance_zone   = var.default_zone
  instance_cores  = 2
  instance_memory = 2
  instance_nat    = false
  instance_ipv4   = true

  instance_image_id  = "fd8e8q6sjccuijiqs9t1" #CentOS8 Stream
  instance_subnet_id = module.subnet_private.yandex_vpc_subnet.id

  providers = {
    yandex = yandex.yandex
  }

  depends_on = [
    module.subnet_public
  ]
}