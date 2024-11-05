# Installing jenkins using IAC with ubuntu 22 and jdk 17

# Creating VPC for jenkins
resource "aws_vpc" "jenkins_vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "default"

  tags = {
    Name = "jenkinsVPC"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jenkinsIG"
  }
}

# Create a Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate the Route Table with the Public Subnet
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


# Create a Public Jenkins Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = "${var.region}a" # Adjust to fit your availability zones
  map_public_ip_on_launch = true

  tags = {
    Name = "jenkins_subnet"
  }
}

# Create a Jenkins Security Group
resource "aws_security_group" "jenkins_sg" {
  vpc_id = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidrs # Allow SSH from anywhere (consider tightening this)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_allowed_cidrs # Allow https from anywhere 
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.https_allowed_cidrs # Allow https from anywhere 
  }

  # Allow Jenkins
  ingress {
    from_port   = var.jenkins_port
    to_port     = var.jenkins_port
    protocol    = "tcp"
    cidr_blocks = var.http_allowed_cidrs # Use HTTP CIDR for Jenkins
    description = "Allow Jenkins access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AllowSSHAndHTTP"
  }
}

# Create an EC2 Instance
resource "aws_instance" "jenkins_server" {
  ami             = var.ami_id # Pass the AMI ID as a variable
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.jenkins_sg.id}"]
  subnet_id       = aws_subnet.public_subnet.id

 user_data = file("jenkins_user_data.sh") # Load user data from the external script
  
  tags = var.instance_tags # Use variable tags

}
