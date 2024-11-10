#!/bin/bash
# This script will run automatically when the instance is launched

# Update the system
yum update -y

# Install the AWS CLI (Amazon Linux 2 comes with it, but this ensures it's up to date)
yum install -y aws-cli

# Install a simple package (for example, httpd - Apache Web Server)
yum install -y httpd

# Start the Apache web server
service httpd start

# Enable Apache to start on boot
chkconfig httpd on

# Create a simple index.html page for the Apache server
echo "<h1>Welcome to your EC2 instance!</h1>" > /var/www/html/index.html

# Display the public IP of the instance (useful for debugging)
echo "Instance Public IP: $(curl http://169.254.169.254/latest/meta-data/public-ipv4)"