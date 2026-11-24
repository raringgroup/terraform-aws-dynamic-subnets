## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
## Copyright 2017-2023 Cloud Posse, LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ----------------------------------------------------------------------------

provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "SevenPico/vpc/aws"
  version = "3.0.0"

  ipv4_primary_cidr_block          = "172.16.0.0/16"
  assign_generated_ipv6_cidr_block = false # disable IPv6

  context = module.context.self
}

resource "aws_eip" "nat_ips" {
  #checkov:skip=CKV2_AWS_19:skipping 'Ensure that all EIP addresses allocated to a VPC are attached to EC2 instances'
  count = length(var.availability_zones)

  vpc = true

  depends_on = [
    module.vpc
  ]
}

module "subnets" {
  source = "../../"

  availability_zones   = var.availability_zones
  vpc_id               = module.vpc.vpc_id
  igw_id               = [module.vpc.igw_id]
  ipv4_cidr_block      = [module.vpc.vpc_cidr_block]
  nat_elastic_ips      = aws_eip.nat_ips.*.public_ip
  nat_gateway_enabled  = true
  nat_instance_enabled = false

  subnets_per_az_count = var.subnets_per_az_count
  subnets_per_az_names = var.subnets_per_az_names

  context = module.context.self
}
