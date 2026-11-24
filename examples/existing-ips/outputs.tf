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

output "existing_ips" {
  description = "Elastic IP Addresses created by this module for use by NAT"
  value       = aws_eip.nat_ips.*.public_ip
}

output "nat_ips" {
  description = "IP Addresses in use by NAT"
  value       = module.subnets.nat_ips
}

output "az_private_subnets_map" {
  description = "Map of AZ names to list of private subnet IDs in the AZs"
  value       = module.subnets.az_private_subnets_map
}

output "az_public_subnets_map" {
  description = "Map of AZ names to list of public subnet IDs in the AZs"
  value       = module.subnets.az_public_subnets_map
}

output "az_private_route_table_ids_map" {
  description = "Map of AZ names to list of private route table IDs in the AZs"
  value       = module.subnets.az_private_route_table_ids_map
}

output "az_public_route_table_ids_map" {
  description = "Map of AZ names to list of public route table IDs in the AZs"
  value       = module.subnets.az_public_route_table_ids_map
}

output "named_private_subnets_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of private subnet IDs"
  value       = module.subnets.named_private_subnets_map
}

output "named_public_subnets_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of public subnet IDs"
  value       = module.subnets.named_public_subnets_map
}

output "named_private_route_table_ids_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of private route table IDs"
  value       = module.subnets.named_private_route_table_ids_map
}

output "named_public_route_table_ids_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of public route table IDs"
  value       = module.subnets.named_public_route_table_ids_map
}

output "named_private_subnets_stats_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of objects with each object having three items: AZ, private subnet ID, private route table ID"
  value       = module.subnets.named_private_subnets_stats_map
}

output "named_public_subnets_stats_map" {
  description = "Map of subnet names (specified in `subnets_per_az_names` variable) to lists of objects with each object having three items: AZ, public subnet ID, public route table ID"
  value       = module.subnets.named_public_subnets_stats_map
}
