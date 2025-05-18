variable "front_lb_name" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "front_lb_sg_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "back_lb_name" {
  type = string
}
variable "back_lb_sg_id" {
  type = string
}
