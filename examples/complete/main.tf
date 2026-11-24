## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
## Copyright 2017-2025 Cloud Posse, LLC
## Modified by Raring Group LLC from cloudposse/terraform-aws-dynamic-subnets.
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

  ipv4_primary_cidr_block                   = "172.16.0.0/16"
  assign_generated_ipv6_cidr_block          = true
  ipv6_egress_only_internet_gateway_enabled = true

  context = module.context.self
}

module "subnets" {
  source = "../../"

  availability_zones      = var.availability_zones
  vpc_id                  = module.vpc.vpc_id
  igw_id                  = [module.vpc.igw_id]
  ipv4_enabled            = true
  ipv6_enabled            = true
  ipv6_egress_only_igw_id = [module.vpc.ipv6_egress_only_igw_id]
  ipv4_cidr_block         = [module.vpc.vpc_cidr_block]
  ipv6_cidr_block         = [module.vpc.vpc_ipv6_cidr_block]
  nat_gateway_enabled     = false
  nat_instance_enabled    = false
  route_create_timeout    = "5m"
  route_delete_timeout    = "10m"

  subnet_type_tag_key = "cpco.io/subnet/type"

  subnets_per_az_count = var.subnets_per_az_count
  subnets_per_az_names = var.subnets_per_az_names

  context = module.context.self
}
