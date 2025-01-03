provider "aws" {
  region = "ca-central-1"
}

# Import VPC and subnets from CloudFormation
data "aws_vpc" "network" {
  filter {
    name   = "tag:aws:cloudformation:stack-name"
    values = ["NetworkStack"]
  }
}

module "web_tier" {
  source      = "./modules/web-tier"
  vpc_id      = data.aws_vpc.network.id
  public_subnet_ids = data.aws_subnet_ids.public.ids
}

module "app_tier" {
  source      = "./modules/app-tier"
  vpc_id      = data.aws_vpc.network.id
  private_subnet_ids = data.aws_subnet_ids.private.ids
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = data.aws_vpc.network.id
  db_subnet_group   = data.aws_db_subnet_group.rds_group.name
  db_instance_class = "db.t3.micro"
  db_name           = "mydatabase"
}

module "alb" {
  source = "./modules/alb"
  vpc_id = data.aws_vpc.network.id
}
