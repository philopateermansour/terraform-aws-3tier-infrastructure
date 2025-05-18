resource "aws_security_group" "back_sg" {
  name        = "back_sg"
  description = "Allow inbound traffic from back load balancer"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.back_lb_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
        Name = var.back_sg_name
    }
}