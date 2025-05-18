  resource "aws_rds_cluster" "mysql_aurora" {
    cluster_identifier      = "aurora-cluster-demo"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.4"
    availability_zones      = var.availability_zones
    database_name           = var.db_name
    master_username         = var.username
    master_password         = var.password
    backup_retention_period = 5
    db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
    skip_final_snapshot = true
    vpc_security_group_ids = [var.rds_sg_id]
  }
  resource "aws_rds_cluster_instance" "mysql_writer" {
    identifier              = "aurora-cluster-demo-instance-1"
    cluster_identifier      = aws_rds_cluster.mysql_aurora.id
    instance_class          = "db.t3.medium" 
    engine                  = aws_rds_cluster.mysql_aurora.engine
    engine_version          = aws_rds_cluster.mysql_aurora.engine_version
    publicly_accessible     = false
    db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name
  }
  resource "aws_rds_cluster_instance" "mysql_reader" {
    identifier              = "aurora-cluster-demo-instance-reader"
    cluster_identifier      = aws_rds_cluster.mysql_aurora.id
    instance_class          = "db.t3.medium"
    engine                  = aws_rds_cluster.mysql_aurora.engine
    engine_version          = aws_rds_cluster.mysql_aurora.engine_version
    publicly_accessible     = false
    db_subnet_group_name    = aws_db_subnet_group.mysql_subnet_group.name
  }
  resource "aws_appautoscaling_target" "aurora_reader_target" {
    max_capacity       = 3
    min_capacity       = 1
    resource_id        = "cluster:${aws_rds_cluster.mysql_aurora.cluster_identifier}"
    scalable_dimension = "rds:cluster:ReadReplicaCount"
    service_namespace  = "rds"
  }

  resource "aws_appautoscaling_policy" "aurora_reader_policy" {
    name               = "aurora-reader-cpu-policy"
    policy_type        = "TargetTrackingScaling"
    resource_id        = aws_appautoscaling_target.aurora_reader_target.resource_id
    scalable_dimension = aws_appautoscaling_target.aurora_reader_target.scalable_dimension
    service_namespace  = aws_appautoscaling_target.aurora_reader_target.service_namespace

    target_tracking_scaling_policy_configuration {
      predefined_metric_specification {
        predefined_metric_type = "RDSReaderAverageCPUUtilization"
      }
      target_value       = 70.0
      scale_in_cooldown  = 300
      scale_out_cooldown = 300
    }
  }
