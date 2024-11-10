resource "aws_db_instance" "rds" {
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  allocated_storage    = 8
  db_name              = "rds"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin1234"
  #parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot    = true
}