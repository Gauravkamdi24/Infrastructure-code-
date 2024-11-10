resource "aws_subnet" "public_subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"
  cidr_block              = "10.0.208.0/20"

  tags = {
    Name = "public_subnet-3"
  }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1a"
  cidr_block              = "10.0.224.0/19"

  tags = {
    Name = "public_subnet-2"
  }
}


resource "aws_subnet" "pvt_subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"
  cidr_block              = "10.0.128.0/18"

  tags = {
    Name = "pvt_subnet-1"
  }
}

resource "aws_subnet" "pvt_subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"
  cidr_block              = "10.0.192.0/21"

  tags = {
    Name = "pvt_subnet-2"
  }
}


