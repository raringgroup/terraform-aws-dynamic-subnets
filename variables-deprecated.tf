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

variable "aws_route_create_timeout" {
  type        = string
  description = <<-EOT
    DEPRECATED: Use `route_create_timeout` instead.
    Time to wait for AWS route creation, specified as a Go Duration, e.g. `2m`
    EOT
  default     = null
}

variable "aws_route_delete_timeout" {
  type        = string
  description = <<-EOT
    DEPRECATED: Use `route_delete_timeout` instead.
    Time to wait for AWS route deletion, specified as a Go Duration, e.g. `2m`
    EOT
  default     = null
}

variable "subnet_type_tag_key" {
  type        = string
  description = <<-EOT
    DEPRECATED: Use `public_subnets_additional_tags` and `private_subnets_additional_tags` instead
    Key for subnet type tag to provide information about the type of subnets, e.g. `cpco.io/subnet/type: private` or `cpco.io/subnet/type: public`
    EOT
  default     = null
}

variable "subnet_type_tag_value_format" {
  description = <<-EOT
    DEPRECATED: Use `public_subnets_additional_tags` and `private_subnets_additional_tags` instead.
    The value of the `subnet_type_tag_key` will be set to `format(var.subnet_type_tag_value_format, <type>)`
    where `<type>` is either `public` or `private`.
    EOT
  type        = string
  default     = "%s"
}

variable "root_block_device_encrypted" {
  type        = bool
  default     = null
  description = <<-EOT
    DEPRECATED: use `nat_instance_root_block_device_encrypted` instead.
    Whether to encrypt the root block device on the created NAT instances
    EOT
}
