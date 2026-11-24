## ----------------------------------------------------------------------------
## Copyright 2017-2025 Cloud Posse, LLC
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

# This file is just for "moved" declarations for backward compatibility

moved {
  from = aws_eip.nat_instance
  to   = aws_eip.default
}

moved {
  from = aws_route.default
  to   = aws_route.nat4
}

moved {
  from = aws_route_table_association.public_default
  to   = aws_route_table_association.public
}
