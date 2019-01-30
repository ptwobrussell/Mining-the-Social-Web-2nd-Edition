#
# Cookbook Name:: apt
# Resource:: preference
#
# Copyright 2010-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :add, :remove

def initialize(*args)
  super
  @action = :add
end

attribute :package_name, :kind_of => String, :name_attribute => true
attribute :glob, :kind_of => String
attribute :pin, :kind_of => String
attribute :pin_priority, :kind_of => String
