module "network" {
  source    = "./modules/network"
  vpc_name  = var.vpc_name
  vpc_cidr  = var.vpc_cidr
  i_gw_name = var.i_gw_name
  nat_gw_name = var.nat_gw_name
  public_route_table_name = var.public_route_table_name
  private_route_table_name = var.private_route_table_name
}
module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
  front_sg_name = var.front_sg_name
  back_sg_name = var.back_sg_name
  lb_sg_name = var.lb_sg_name
}
module "compute" {
  source = "./modules/compute"
  front_sg_id = module.security.front_sg_id
  back_sg_id = module.security.back_sg_id
  private_subnet_ids = module.network.private_subnet_ids
  front_tg_arn = module.lb.front_tg_arn
  key_pair_name = var.key_pair_name
  back_tg_arn = module.lb.back_tg_arn
  db_host = module.database.mysql_endpoint
  db_name = module.database.db_name
  db_user = module.database.db_user
  db_pass = module.database.db_password
  back_alb_dns = module.lb.back_alb_dns
  instance_profile_name = module.security.instance_profile_name
}
module "database" {
  source = "./modules/database"
  private_subnet_ids = module.network.private_subnet_ids
  mysql_subnet_group_name = var.mysql_subnet_group_name
  username = var.username
  password = var.password
  db_name = var.db_name
  availability_zones = var.availability_zones
  back_sg_id = module.security.back_sg_id
  rds_sg_id = module.security.rds_sg_id
}
module "lb" {
  source = "./modules/load-balancer"
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  front_lb_sg_id = module.security.lb_sg_id
  front_lb_name = var.front_lb_name
  back_lb_name = var.back_lb_name
  back_lb_sg_id = module.security.back_lb_sg_id
}