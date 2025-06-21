resource "aws_launch_template" "backend_template" {
  name_prefix   = "backend"
  image_id      = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.back_sg_id]
  iam_instance_profile {
    name = var.instance_profile_name
  }
  key_name = var.key_pair_name
  
  user_data = base64encode(templatefile("${path.module}/back-user-data.sh",{
    db_host = var.db_host
    db_name = var.db_name
    db_user = var.db_user
    db_pass = var.db_pass
    }
    ))
  tags = {
    Name = "backend-instance"
  }
}

resource "aws_autoscaling_group" "backend_asg" {
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = 3
  max_size            = 5
  min_size            = 3

  target_group_arns = [var.back_tg_arn]

  launch_template {
    id      = aws_launch_template.backend_template.id
    version = "$Latest"
  }

}

resource "aws_autoscaling_policy" "cpu_target" {
  name                   = "cpu-target-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.backend_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0 
  }
}