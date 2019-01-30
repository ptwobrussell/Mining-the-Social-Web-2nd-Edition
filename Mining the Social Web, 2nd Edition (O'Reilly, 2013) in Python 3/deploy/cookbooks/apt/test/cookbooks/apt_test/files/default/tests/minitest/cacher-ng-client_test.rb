#
# Cookbook Name:: apt_test
# Recipe:: cacher-ng-client_test.rb
#
# Copyright 2013, Opscode, Inc.
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

require File.expand_path('../support/helpers', __FILE__)

describe "apt_test::cacher-ng-client" do
  include Helpers::AptTest

  it 'runs the cacher service' do
    service("apt-cacher-ng").must_be_running
  end

  it 'creates 01proxy' do
    file('/etc/apt/apt.conf.d/01proxy').must_include "Acquire::http::Proxy \"http://#{node['ipaddress']}:#{node['apt']['cacher_port']}\";"
  end

end
