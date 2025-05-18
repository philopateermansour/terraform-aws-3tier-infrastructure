variable "front_sg_id" {
  type = string
}
variable "back_sg_id" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "front_tg_arn" {
  type = string
}
variable "back_tg_arn" {
  type = string
}
variable "key_pair_name" {
  type = string
}
variable "db_host" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_user" {
  type = string
}
variable "db_pass" {
  type = string
  sensitive = true
}
variable "back_alb_dns" {
  type = string
}
variable "instance_profile_name" {
  type = string
}