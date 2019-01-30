#
# Cookbook Name:: runit
# Recipe:: default
#
# Copyright 2008-2010, Opscode, Inc.
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

service "runit" do
  action :nothing
end

execute "start-runsvdir" do
  command value_for_platform(
    "debian" => { "default" => "runsvdir-start" },
    "ubuntu" => { "default" => "start runsvdir" },
    "gentoo" => { "default" => "/etc/init.d/runit-start start" }
  )
  action :nothing
end

execute "runit-hup-init" do
  command "telinit q"
  only_if "grep ^SV /etc/inittab"
  action :nothing
end

case node["platform_family"]
when "rhel"

  include_recipe "build-essential"

  packages = %w{rpm-build rpmdevtools tar gzip}
  packages.each do |p|
    package p
  end

  if node["platform_version"].to_i >= 6
    package "glibc-static"
  else
    package "buildsys-macros"
  end

  cookbook_file "#{Chef::Config[:file_cache_path]}/runit-2.1.1.tar.gz" do
    source "runit-2.1.1.tar.gz"
    not_if "rpm -qa | grep -q '^runit'"
    notifies :run, "bash[rhel_build_install]", :immediately
  end

  bash "rhel_build_install" do
    user "root"
    cwd Chef::Config[:file_cache_path]
    code <<-EOH
      tar xzf runit-2.1.1.tar.gz
      cd runit-2.1.1
      ./build.sh
    EOH
    notifies :install, "rpm_package[runit-211]", :immediately
    action :nothing
  end

  rpm_package "runit-211" do
    source "/root/rpmbuild/RPMS/runit-2.1.1.rpm"
    action :nothing
  end

when "debian","gentoo"

  package "runit" do
    action :install
    if platform?("ubuntu", "debian")
      response_file "runit.seed"
    end
    notifies value_for_platform(
      "debian" => { "4.0" => :run, "default" => :nothing  },
      "ubuntu" => {
        "default" => :nothing,
        "9.04" => :run,
        "8.10" => :run,
        "8.04" => :run },
      "gentoo" => { "default" => :run }
    ), "execute[start-runsvdir]", :immediately
    notifies value_for_platform(
      "debian" => { "squeeze/sid" => :run, "default" => :nothing },
      "default" => :nothing
    ), "execute[runit-hup-init]", :immediately
  end

  if node["platform"] =~ /ubuntu/i && node["platform_version"].to_f <= 8.04
    cookbook_file "/etc/event.d/runsvdir" do
      source "runsvdir"
      mode 0644
      notifies :run, "execute[start-runsvdir]", :immediately
      only_if do ::File.directory?("/etc/event.d") end
    end
  end
  if platform?("gentoo")
    template "/etc/init.d/runit-start" do
      source "runit-start.sh.erb"
      mode 0755
    end
  end
end
