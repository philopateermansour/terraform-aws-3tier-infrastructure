resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "mysql_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = var.mysql_subnet_group_name
  }
}