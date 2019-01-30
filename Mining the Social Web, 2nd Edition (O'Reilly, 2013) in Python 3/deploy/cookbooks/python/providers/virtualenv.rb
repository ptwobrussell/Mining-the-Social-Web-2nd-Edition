#
# Author:: Seth Chisamore <schisamo@opscode.com>
# Cookbook Name:: python
# Provider:: virtualenv
#
# Copyright:: 2011, Opscode, Inc <legal@opscode.com>
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

require 'chef/mixin/shell_out'
require 'chef/mixin/language'
include Chef::Mixin::ShellOut

def whyrun_supported?
  true
end

action :create do
  unless exists?
    Chef::Log.info("Creating virtualenv #{new_resource} at #{new_resource.path}")
    execute "#{virtualenv_cmd} --python=#{new_resource.interpreter} #{new_resource.options} #{new_resource.path}" do
      user new_resource.owner if new_resource.owner
      group new_resource.group if new_resource.group
    end
    new_resource.updated_by_last_action(true)
  end
end

action :delete do
  if exists?
    description = "delete virtualenv #{new_resource} at #{new_resource.path}"
    converge_by(description) do
       Chef::Log.info("Deleting virtualenv #{new_resource} at #{new_resource.path}")
       FileUtils.rm_rf(new_resource.path)
    end
  end
end

def load_current_resource
  @current_resource = Chef::Resource::PythonVirtualenv.new(new_resource.name)
  @current_resource.path(new_resource.path)

  if exists?
    cstats = ::File.stat(current_resource.path)
    @current_resource.owner(cstats.uid)
    @current_resource.group(cstats.gid)
  end
  @current_resource
end

def virtualenv_cmd()
  if node['python']['install_method'].eql?("source")
    ::File.join(node['python']['prefix_dir'], "/bin/virtualenv")
  else
    "virtualenv"
  end
end

private
def exists?
  ::File.exist?(current_resource.path) && ::File.directory?(current_resource.path) \
    && ::File.exists?("#{current_resource.path}/bin/activate")
end
