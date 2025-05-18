output "front_sg_id" {
  value = aws_security_group.front_sg.id
}
output "back_sg_id" {
  value = aws_security_group.back_sg.id
}
output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}
output "back_lb_sg_id" {
  value = aws_security_group.back_lb_sg.id
}
output "instance_profile_name" {
  value = aws_iam_instance_profile.ssm_profile.name
}
output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
  
}