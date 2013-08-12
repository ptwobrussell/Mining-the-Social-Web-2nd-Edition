#
# Author:: Sean Porter <portertech@hw-ops.com>
# Cookbook Name:: python
# Recipe:: test_virtualenv
#
# Copyright 2013, Heavy Water Operations, LLC.
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

python_virtualenv "/tmp/virtualenv" do
  interpreter "python"
  owner "root"
  group "root"
  action :create
end

python_virtualenv "isolated python environment" do
  path "/tmp/tobedestroyed"
  interpreter "python"
  action :create
end

python_virtualenv "deleting the isolated python environment" do
  path "/tmp/tobedestroyed"
  action :delete
end
