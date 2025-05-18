output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [
  for subnet in aws_subnet.main :
  subnet.id if subnet.tags["Type"] == "public"
]
}
output "private_subnet_ids" {
  value = [
  for subnet in aws_subnet.main :
  subnet.id if subnet.tags["Type"] == "private"
]
}