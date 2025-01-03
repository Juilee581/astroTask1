resource "aws_lb" "alb" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-059ab3b4e8f8eb903"] #
  subnets            = ["subnet-00d329604983bebb9"]
}

output "alb_dns" {
  value = aws_lb.alb.dns_name # Corrected to dns_name
}
