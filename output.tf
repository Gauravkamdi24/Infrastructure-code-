output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.myalb.dns_name
}