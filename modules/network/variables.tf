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