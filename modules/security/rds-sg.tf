resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow inbound traffic from back instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.back_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
    tags = {
        Name = var.front_sg_name
    }
}