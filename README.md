# resources-two-regions
Code that create resources in two regions

## Pre-requirements
- [git](https://git-scm.com/downloads) need to be installed 
- [terraform](https://www.terraform.io/downloads.html) need to be installed
- [aws account](https://aws.amazon.com/free/)

## How to consume

```bash
git clone git@github.com:base-line/resources-two-regions.git
cd resources-two-regions
terraform init
terraform apply
```

## As result

as result terraform will create VPC in two different AWS regions using one single module, check using `terraform show` the output should be similar

```bash
...
# module.frankfurt.aws_vpc.tf_vpc:
resource "aws_vpc" "tf_vpc" {
    arn                              = "arn:aws:ec2:eu-central-1:267023797923:vpc/vpc-063cd4db9a059d08f"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "172.16.0.0/16"
    default_network_acl_id           = "acl-040da0c90c2a66bff"
    default_route_table_id           = "rtb-072192f8a1ab290cd"
    default_security_group_id        = "sg-00685d1ef348d7b53"
    dhcp_options_id                  = "dopt-e090308a"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-063cd4db9a059d08f"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-072192f8a1ab290cd"
    owner_id                         = "267023797923"
    tags                             = {
        "Name" = "vps-central-eu"
    }
}
...
# module.stockholm.aws_vpc.tf_vpc:
resource "aws_vpc" "tf_vpc" {
    arn                              = "arn:aws:ec2:eu-north-1:267023797923:vpc/vpc-00e2e020664e0f3c5"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.0.0.0/16"
    default_network_acl_id           = "acl-0550272bde6222da3"
    default_route_table_id           = "rtb-02ff064dafceb2512"
    default_security_group_id        = "sg-0aedd12b670dd54d7"
    dhcp_options_id                  = "dopt-c560cdac"
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-00e2e020664e0f3c5"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-02ff064dafceb2512"
    owner_id                         = "267023797923"
    tags                             = {
        "Name" = "vps-north-eu"
    }
}
...
```

## Destroy

destroy created infrastructure if need be

```
terraform destroy
```