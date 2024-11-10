resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Security group for db instance"
  vpc_id      = aws_vpc.vpc.id



  ingress {
    description = "Allow inbound traffic from application layer"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "db_sg"
  }

}