output "mysql_endpoint" {
  value = aws_rds_cluster.mysql_aurora.endpoint
}
output "db_name" {
  value = aws_rds_cluster.mysql_aurora.database_name  
}
output "db_user" {
  value = aws_rds_cluster.mysql_aurora.master_username
}
output "db_password" {
  value = aws_rds_cluster.mysql_aurora.master_password
}
