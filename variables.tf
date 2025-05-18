variable "aws_region" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "i_gw_name" {
  type = string
}
variable "nat_gw_name" {
  type = string 
}
variable "public_route_table_name" {
  type = string
}
variable "private_route_table_name" {
  type = string
}
variable "front_sg_name" {
  type = string
}
variable "back_sg_name" {
  type = string
}
variable "lb_sg_name" {
  type = string
}
variable "mysql_subnet_group_name" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "db_name" {
  type = string
}
variable "availability_zones" {
  type = list(string)
}
variable "key_pair_name" {
  type = string
}
variable "front_lb_name" {
  type = string
}
variable "back_lb_name" {
  type = string
}