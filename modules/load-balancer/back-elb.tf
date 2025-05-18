resource "aws_lb" "back-alb" {
  name               = var.back_lb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.back_lb_sg_id]
  subnets            = var.private_subnet_ids
  enable_deletion_protection = false
}
resource "aws_lb_target_group" "back_tg" {
  name     = "back-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
  health_check {
    path                = "/health"
    port                = 8080
    protocol            = "HTTP"
    interval            = 30
    timeout             = 15
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}
resource "aws_lb_listener" "back_listener" {
  load_balancer_arn = aws_lb.back-alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.back_tg.arn
  }
}