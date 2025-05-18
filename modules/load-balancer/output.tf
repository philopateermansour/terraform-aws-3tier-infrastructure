output "front_tg_arn" {
  value = aws_lb_target_group.front_tg.arn
}
output "back_tg_arn" {
  value = aws_lb_target_group.back_tg.arn
  
}
output "back_alb_dns" {
  value = aws_lb.back-alb.dns_name
}