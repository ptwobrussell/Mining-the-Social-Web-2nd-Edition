#
# Cookbook Name:: apt_test
# Recipe:: lwrps
#
# Copyright 2012, Opscode, Inc.
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

describe "apt_test::lwrps" do
  include Helpers::AptTest

  it 'creates the Opscode sources.list' do
    file("/etc/apt/sources.list.d/opscode.list").must_exist
  end

  it 'adds the Opscode package signing key' do
    opscode_key = shell_out("apt-key list")
    assert opscode_key.stdout.include?("Opscode Packages <packages@opscode.com>")
  end

  it 'creates the correct pinning preferences for chef' do
    pinning_prefs = "Package: chef\nPin: version 10.16.2-1"
    file("/etc/apt/preferences.d/chef").must_match(/#{pinning_prefs}/)
  end

  it 'creates a repo with an architecture' do
    cloudera = "deb\s+\\[arch=amd64\\] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib"
    file("/etc/apt/sources.list.d/cloudera.list").must_match(/#{cloudera}/)
  end

  it 'creates the correct pinning preferences with a glob' do
    pinning_prefs = "Package: \\*\nPin: origin packages.dotdeb.org"
    file("/etc/apt/preferences.d/dotdeb").must_match(/#{pinning_prefs}/)
  end
end
