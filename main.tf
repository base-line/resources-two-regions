# Module 1. creates VPC in eu-central-1 region
module "frankfurt" {
  source = "github.com/andrewpopa/terraform-aws-vpc"

  # VPC
  cidr_block          = "172.16.0.0/16"
  vpc_public_subnets  = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"]
  vpc_private_subnets = ["172.16.13.0/24", "172.16.14.0/24", "172.16.15.0/24"]
  availability_zones  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  vpc_tags = {
    vpc            = "vps-central-eu"
    public_subnet  = "public-subnet-frankfurt"
    private_subnet = "private-subnet-frankfurt"
    internet_gw    = "my-internet-gateway-frankfurt"
    nat_gateway    = "nat-gateway-frankfurt"
  }

  providers = {
    aws = aws.frankfurt
  }
}

# Module 2. creates VPC in eu-north-1 region
module "stockholm" {
  source = "github.com/andrewpopa/terraform-aws-vpc"

  # VPC
  availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_tags = {
    vpc            = "vps-north-eu"
    public_subnet  = "public-subnet-stockholm"
    private_subnet = "private-subnet-stockholm"
    internet_gw    = "my-internet-gateway-stockholm"
    nat_gateway    = "nat-gateway-stockholm"
  }

  providers = {
    aws = aws.stockholm
  }
}