resource "aws_launch_template" "front-template" {
  name_prefix   = "front"

  image_id      = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.front_sg_id]
  iam_instance_profile {
    name = var.instance_profile_name
  }
  key_name = var.key_pair_name 

  user_data = base64encode(templatefile("${path.module}/front-user-data.sh",{
    back_alb_dns = var.back_alb_dns
    }
    ))

  tags = {
    Name = "frontend-instance"
  }

}   

resource "aws_autoscaling_group" "front-asg" {
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity   = 3
  max_size           = 5
  min_size           = 3
  
  target_group_arns = [var.front_tg_arn]
  
  launch_template {
    id      = aws_launch_template.front-template.id
    version = "$Latest"
  }
}