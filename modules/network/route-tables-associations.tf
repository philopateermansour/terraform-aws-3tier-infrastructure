resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.main["public-subnet-1"].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.main["public-subnet-2"].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-3" {
  subnet_id      = aws_subnet.main["public-subnet-3"].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.main["private-subnet-1"].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.main["private-subnet-2"].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private-3" {
  subnet_id      = aws_subnet.main["private-subnet-3"].id
  route_table_id = aws_route_table.private.id
}
# resource "aws_route_table_association" "private-4" {
#   subnet_id      = aws_subnet.main["private-subnet-4"].id
#   route_table_id = aws_route_table.private.id
# }
# resource "aws_route_table_association" "private-5" {
#   subnet_id      = aws_subnet.main["private-subnet-5"].id
#   route_table_id = aws_route_table.private.id
# }
# resource "aws_route_table_association" "private-6" {
#   subnet_id      = aws_subnet.main["private-subnet-6"].id
#   route_table_id = aws_route_table.private.id
# }
