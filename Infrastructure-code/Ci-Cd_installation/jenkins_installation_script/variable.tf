variable "region" {
  description = "The AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "The AMI ID for Ubuntu 22.04"
 # type        = string
  default     = "ami-09b0a86a2c84101e1"
}

variable "instance_type" {
  description = "The type of instance"
  default     = "t2.micro"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "ssh_allowed_cidrs" {
  description = "CIDR blocks to allow SSH access"
  default     = ["0.0.0.0/0"]
}

variable "http_allowed_cidrs" {
  description = "CIDR blocks to allow HTTP access"
  default     = ["0.0.0.0/0"]
}

variable "https_allowed_cidrs" {
  description = "CIDR blocks to allow HTTPS access"
  default     = ["0.0.0.0/0"]
}

variable "jenkins_port" {
  description = "The port for Jenkins"
  default     = 8080
}

variable "allowed_ports" {
  description = "List of allowed ports for security group"
  default     = [22, 80, 443, 8080]
}

variable "instance_tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default     = {
    Name = "jenkins-server"
  }
}
