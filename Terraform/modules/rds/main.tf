resource "aws_db_instance" "rds" {
  identifier              = "astro-rds"
  engine                  = "mysql"
  instance_class          = var.db_instance_class
  allocated_storage       = 20
  db_name                 = var.db_astro
  username                = "TerraUser"
  password                = "Miffy171030@@@"
  skip_final_snapshot     = true
  publicly_accessible     = false
  vpc_security_group_ids  = []
}

output "db_endpoint" {
  value = aws_db_instance.rds.endpoint
}
