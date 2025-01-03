resource "aws_instance" "web" {
  ami           = "ami-051ed863837a0b1b6"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_ids[0]
  tags = {
    Name = "WebTier"
  }
}

output "instance_ips" {
  value = aws_instance.web.public_ip
}
