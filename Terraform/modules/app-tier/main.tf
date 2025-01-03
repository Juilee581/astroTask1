resource "aws_instance" "app" {
  ami           = "ami-051ed863837a0b1b6"
  instance_type = "2.micro"
  subnet_id     = var.private_subnet_ids[0]
  tags = {
    Name = "AppTier"
  }
}
