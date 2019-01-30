#
# Author:: Scott M. Likens <scott@mopub.com>
# Cookbook Name:: python
# Recipe:: test_exert
#
# Copyright 2013, MoPub, Inc.
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

python_virtualenv "#{Chef::Config[:file_cache_path]}/virtualenv" do
  interpreter "python"
  owner "root"
  group "root"
  action :create
end

python_pip "boto" do
  action :install
  virtualenv "#{Chef::Config[:file_cache_path]}/virtualenv"
end

python_pip "psutil" do
  action :install
end

