resource "aws_route_table_association" "route-1" {
  subnet_id      = aws_subnet.public_subnet-3.id
  route_table_id = aws_route_table.myrt.id

}

resource "aws_route_table_association" "route-b" {
  subnet_id      = aws_subnet.pvt_subnet-1.id
  route_table_id = aws_route_table.myrt.id
}