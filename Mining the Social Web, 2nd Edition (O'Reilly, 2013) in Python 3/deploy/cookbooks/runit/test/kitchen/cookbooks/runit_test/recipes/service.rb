#
# Cookbook Name:: runit_test
# Recipe:: service
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

include_recipe "runit::default"

package "netcat" do
  package_name "nc" if platform_family?('rhel', 'fedora')
end

# Create a normal user to run services later
group "floyd"

user "floyd" do
  comment "Floyd the App Runner"
  gid "floyd"
  shell "/bin/bash"
  home "/home/floyd"
  manage_home true
  supports :manage_home => true
end

["sv", "service"].each do |dir|

  directory "/home/floyd/#{dir}" do
    owner "floyd"
    group "floyd"
    recursive true
  end

end

# Create a service with all the fixin's
runit_service "plain-defaults"

# Create a service that doesn't use the svlog
runit_service "no-svlog" do
  log false
end

# Create a service that uses the default svlog
runit_service "default-svlog" do
  default_logger true
end

# Create a service that has a finish script
runit_service "finisher" do
  finish true
end

# Create a service that uses env files
runit_service "env-files" do
  env({"PATH" => "$PATH:/opt/chef/embedded/bin"})
end

# Create a service that sets options for the templates
runit_service "template-options" do
  options({:raspberry => "delicious"})
end

# Create a service that uses control signal files
runit_service "control-signals" do
  control ["u"]
end

# Create a runsvdir service for a normal user
runit_service "runsvdir-floyd"

# # Create a service running by a normal user in its runsvdir
runit_service "floyds-app" do
  sv_dir "/home/floyd/sv"
  service_dir "/home/floyd/service"
  owner "floyd"
  group "floyd"
end

# Create a service with differently named template files
runit_service "yerba" do
  log_template_name "yerba-matte"
  finish_script_template_name "yerba-matte"
end

runit_service "yerba-alt" do
  run_template_name "calabash"
  default_logger true
end

# Note: this won't update the run script for the above due to
# http://tickets.opscode.com/browse/COOK-2353
runit_service "the other name for yerba-alt" do
  service_name "yerba-alt"
  default_logger true
end


# Create a service that should exist but be disabled
runit_service "exist-disabled"

log "Created the exist-disabled service, now disable it"

runit_service "exist-disabled" do
  action :disable
end

runit_service "other-cookbook-templates" do
  cookbook "runit-other_test"
end

unless platform_family?("rhel")
  # Create a service that has a package with its own service directory
  package "git-daemon-run"

  runit_service "git-daemon" do
    sv_templates false
  end
end

# Despite waiting for runit to create supervise/ok, sometimes services
# are supervised, but not actually fully started
ruby_block "sleep 5s to allow services to be fully started" do
  block do
    sleep 5
  end
end

# Notify the plain defaults service as a normal service resource
file "/tmp/notifier" do
  content Time.now.to_s
  notifies :restart, 'service[plain-defaults]', :immediately
end
