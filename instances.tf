resource "aws_instance" "terraform1" {
  ami                         = "ami-08bf489a05e916bbd"
  instance_type               = "t2.micro"
  availability_zone           = "ap-south-1a"
  key_name                    = "3-tire-infra-key1"
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.public_subnet-3.id
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")

  tags = {
    Name = "terraform1"
  }
}

resource "aws_instance" "terraform2" {
  ami                         = "ami-08bf489a05e916bbd"
  instance_type               = "t2.micro"
  availability_zone           = "ap-south-1a"
  key_name                    = "3-tire-infra-key1"
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.public_subnet-3.id
  associate_public_ip_address = true
  user_data                   = file("user_data.sh")

  tags = {
    Name = "terraform2"
  }
}