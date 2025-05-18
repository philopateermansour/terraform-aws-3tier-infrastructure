variable "private_subnet_ids" {
  type = list(string)
}
variable "mysql_subnet_group_name" {
  type = string
}
variable "username" {
  type = string
  sensitive = true
}
variable "password" {
  type = string
  sensitive = true
}
variable "db_name" {
  type = string
}
variable "availability_zones" {
  type = list(string) 
}
variable "back_sg_id" {
  type = string
}
variable "rds_sg_id" {
  type = string 
}