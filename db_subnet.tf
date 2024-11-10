resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.pvt_subnet-1.id, aws_subnet.public_subnet-3.id]

  tags = {
    Name = "rds_subnet"
  }
}