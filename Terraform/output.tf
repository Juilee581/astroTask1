output "web_tier_ips" {
  value = module.web_tier.instance_ips
}

output "alb_dns" {
  value = module.alb.alb_dns
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}
