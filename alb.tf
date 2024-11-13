
resource "aws_lb" "myalb" {
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.pvt_subnet-1.id, aws_subnet.public_subnet-3.id]
}

resource "aws_lb_target_group" "mytg" {
  name     = "mytg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}
