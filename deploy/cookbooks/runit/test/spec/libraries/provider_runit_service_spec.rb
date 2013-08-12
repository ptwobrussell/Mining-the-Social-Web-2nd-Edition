#
# Author:: Joshua Timberman <joshua@opscode.com>
# Author:: Seth Chisamore <schisamo@opscode.com>
#
# Copyright:: Copyright (c) 2012, Opscode, Inc. <legal@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$:.unshift(File.join(File.dirname(__FILE__), '..'))
require 'spec_helper'

describe Chef::Provider::Service::Runit do

  subject(:provider) { Chef::Provider::Service::Runit.new(new_resource, run_context) }

  let(:sv_bin) { "/usr/bin/sv" }
  let(:service_name) { "getty.service" }
  let(:service_dir) { "/etc/service" }
  let(:service_dir_name) { "#{service_dir}/#{service_name}" }
  let(:service_status_command) { "#{sv_bin} status #{service_name}" }
  let(:run_script) { File.join(service_dir, service_name, "run") }
  let(:node) do
    node = Chef::Node.new
    node.automatic['platform'] = 'ubuntu'
    node.automatic['platform_version'] = '12.04'
    node.set['runit']['sv_bin'] = sv_bin
    node
  end
  let(:events) { Chef::EventDispatch::Dispatcher.new }
  let(:run_context) { Chef::RunContext.new(node, {}, events) }

  let(:new_resource) { Chef::Resource::RunitService.new('getty.service') }
  let(:current_resource) { Chef::Resource::RunitService.new('getty.service') }

  before do
    File.stub(:exist?).with(sv_bin).and_return(true)
    File.stub(:executable?).with(sv_bin).and_return(true)
  end

  describe "#load_current_resource" do

    describe "runit is not installed" do
      before do
        File.unstub(:exist?)
        File.unstub(:executable?)
      end

      it "raises an exception" do
        lambda { provider.load_current_resource }.should raise_error
      end
    end

    describe "parsing sv status output" do
      before do
        provider.stub(:shell_out)
          .with(service_status_command)
          .and_return(mock("ouput", :stdout => status_output, :exitstatus => 0))
        provider.load_current_resource
      end

      context "returns a pid" do
        let(:status_output) { "run: #{service_name}: (pid 29018) 3s; run: log: (pid 24470) 46882s" }

        it "sets resource running state to true" do
          provider.current_resource.running.should be_true
        end
      end

      context "returns an empty pid" do
        let(:status_output) { "down: #{service_name}: 2s, normally up; run: log: (pid 24470) 46250s" }

        it "sets resource running state to false" do
          provider.current_resource.running.should be_false
        end
      end
    end

    describe "checking for service run script" do
      before do
        provider.stub(:running?).and_return(true)
      end

      context "service run script is present in service_dir" do
        before do
          File.stub!(:exists?).with(run_script).and_return(true)
          provider.load_current_resource
        end

        it "sets resource enabled state to true" do
          provider.current_resource.enabled.should be_true
        end
      end

      context "service run script is missing" do
        before do
          File.stub!(:exists?).with(run_script).and_return(false)
          provider.load_current_resource
        end

        it "sets resource enabled state to false" do
          provider.current_resource.enabled.should be_false
        end
      end
    end
  end

  describe "actions" do
    before do
      provider.stub(:running?).and_return(true)
      provider.stub(:enabled?).and_return(true)
      provider.load_current_resource
    end

    describe "start" do

      before do
        provider.stub(:running?).and_return(false)
      end

      %w{start up once cont}.each do |action|
        it "sends the #{action} command to the sv binary" do
          provider.should_receive(:shell_out!).with("#{sv_bin} #{action} #{service_dir_name}")
          provider.run_action(action.to_sym)
        end
      end
    end

    describe 'action_usr1' do
      it 'sends the usr1 signal to the sv binary' do
        provider.should_receive(:shell_out!).with("#{sv_bin} 1 #{service_dir_name}")
        provider.run_action(:usr1)
      end
    end

    describe 'action_usr2' do
      it 'sends the usr2 signal to the sv binary' do
        provider.should_receive(:shell_out!).with("#{sv_bin} 2 #{service_dir_name}")
        provider.run_action(:usr2)
      end
    end

    describe 'actions that manage a running service' do
      before do
        provider.stub(:running?).and_return(true)
      end

      %w{stop down restart hup int term kill}.each do |action|
        it "sends the '#{action}' command to the sv binary" do
          provider.should_receive(:shell_out!).with("#{sv_bin} #{action} #{service_dir_name}")
          provider.run_action(action.to_sym)
        end
      end

      describe 'action_reload' do
        it "sends the 'force-reload' command to the sv binary" do
          provider.should_receive(:shell_out!).with("#{sv_bin} force-reload #{service_dir_name}")
          provider.run_action(:reload)
        end
      end
    end

    describe 'action_disable' do
      before do
        provider.stub(:enabled?).and_return(true)
      end

      it 'disables the service by running the down command and removing the symlink' do
        provider.should_receive(:shell_out).with("#{sv_bin} down #{service_dir_name}")
        FileUtils.should_receive(:rm).with(service_dir_name)
        provider.run_action(:disable)
      end
    end

    describe "action_enable" do
      let(:sv_dir_name) { ::File.join(new_resource.sv_dir, new_resource.service_name) }

      before(:each) do
        provider.stub(:enabled?).and_return(false)
        current_resource.stub!(:enabled).and_return(true)
        FileTest.stub!(:pipe?).with("#{service_dir_name}/supervise/ok").and_return(true)
      end

      it 'creates the sv_dir directory' do
        provider.send(:sv_dir).path.should eq(sv_dir_name)
        provider.send(:sv_dir).recursive.should be_true
        provider.send(:sv_dir).owner.should eq(new_resource.owner)
        provider.send(:sv_dir).group.should eq(new_resource.group)
        provider.send(:sv_dir).mode.should eq(00755)
      end

      it 'creates the run script template' do
        provider.send(:run_script).path.should eq(::File.join(sv_dir_name, 'run'))
        provider.send(:run_script).owner.should eq(new_resource.owner)
        provider.send(:run_script).group.should eq(new_resource.group)
        provider.send(:run_script).mode.should eq(00755)
        provider.send(:run_script).source.should eq("sv-#{new_resource.service_name}-run.erb")
        provider.send(:run_script).cookbook.should be_empty
      end

      it 'sets up the supervised log directory and run script' do
        provider.send(:log_dir).path.should eq(::File.join(sv_dir_name, 'log'))
        provider.send(:log_dir).recursive.should be_true
        provider.send(:log_dir).owner.should eq(new_resource.owner)
        provider.send(:log_dir).group.should eq(new_resource.group)
        provider.send(:log_dir).mode.should eq(00755)
        provider.send(:log_main_dir).path.should eq(::File.join(sv_dir_name, 'log', 'main'))
        provider.send(:log_main_dir).recursive.should be_true
        provider.send(:log_main_dir).owner.should eq(new_resource.owner)
        provider.send(:log_main_dir).group.should eq(new_resource.group)
        provider.send(:log_main_dir).mode.should eq(00755)
        provider.send(:log_run_script).path.should eq(::File.join(sv_dir_name, 'log', 'run'))
        provider.send(:log_run_script).owner.should eq(new_resource.owner)
        provider.send(:log_run_script).group.should eq(new_resource.group)
        provider.send(:log_run_script).mode.should eq(00755)
        provider.send(:log_run_script).source.should eq("sv-#{new_resource.log_template_name}-log-run.erb")
        provider.send(:log_run_script).cookbook.should be_empty
      end

      it 'creates log/run with default content if default_logger parameter is true' do
        script_content = "exec svlogd -tt /var/log/#{new_resource.service_name}"
        new_resource.default_logger(true)
        provider.send(:log_run_script).path.should eq(::File.join(sv_dir_name, 'log', 'run'))
        provider.send(:log_run_script).owner.should eq(new_resource.owner)
        provider.send(:log_run_script).group.should eq(new_resource.group)
        provider.send(:log_run_script).mode.should eq(00755)
        provider.send(:log_run_script).content.should include(script_content)
        provider.send(:default_log_dir).path.should eq(::File.join('/var', 'log', new_resource.service_name))
        provider.send(:default_log_dir).recursive.should be_true
        provider.send(:default_log_dir).owner.should eq(new_resource.owner)
        provider.send(:default_log_dir).group.should eq(new_resource.group)
        provider.send(:default_log_dir).mode.should eq(00755)
      end

      it 'creates env directory and files' do
        provider.send(:env_dir).path.should eq(::File.join(sv_dir_name, 'env'))
        provider.send(:env_dir).owner.should eq(new_resource.owner)
        provider.send(:env_dir).group.should eq(new_resource.group)
        provider.send(:env_dir).mode.should eq(00755)
        new_resource.env({'PATH' => '$PATH:/usr/local/bin'})
        provider.send(:env_files)[0].path.should eq(::File.join(sv_dir_name, 'env', 'PATH'))
        provider.send(:env_files)[0].owner.should eq(new_resource.owner)
        provider.send(:env_files)[0].group.should eq(new_resource.group)
        provider.send(:env_files)[0].content.should eq('$PATH:/usr/local/bin')
      end

      it 'creates a finish script as a template if finish_script parameter is true' do
        provider.send(:finish_script).path.should eq(::File.join(sv_dir_name, 'finish'))
        provider.send(:finish_script).owner.should eq(new_resource.owner)
        provider.send(:finish_script).group.should eq(new_resource.group)
        provider.send(:finish_script).mode.should eq(00755)
        provider.send(:finish_script).source.should eq("sv-#{new_resource.finish_script_template_name}-finish.erb")
        provider.send(:finish_script).cookbook.should be_empty
      end

      it 'creates control directory and signal files' do
        provider.send(:control_dir).path.should eq(::File.join(sv_dir_name, 'control'))
        provider.send(:control_dir).owner.should eq(new_resource.owner)
        provider.send(:control_dir).group.should eq(new_resource.group)
        provider.send(:control_dir).mode.should eq(00755)
        new_resource.control(['s'])
        provider.send(:control_signal_files)[0].path.should eq(::File.join(sv_dir_name, 'control', 's'))
        provider.send(:control_signal_files)[0].owner.should eq(new_resource.owner)
        provider.send(:control_signal_files)[0].group.should eq(new_resource.group)
        provider.send(:control_signal_files)[0].mode.should eq(00755)
        provider.send(:control_signal_files)[0].source.should eq("sv-#{new_resource.control_template_names['s']}-s.erb")
        provider.send(:control_signal_files)[0].cookbook.should be_empty
      end

      it 'creates a symlink for LSB script compliance unless the platform is debian' do
        node.automatic['platform'] = 'not_debian'
        provider.send(:lsb_init).path.should eq(::File.join('/etc', 'init.d', new_resource.service_name))
        provider.send(:lsb_init).to.should eq(sv_bin)
      end

      it 'creates an init script as a template for LSB compliance if the platform is debian' do
        node.automatic['platform'] = 'debian'
        provider.send(:lsb_init).path.should eq(::File.join('/etc', 'init.d', new_resource.service_name))
        provider.send(:lsb_init).owner.should eq('root')
        provider.send(:lsb_init).group.should eq('root')
        provider.send(:lsb_init).mode.should eq(00755)
        provider.send(:lsb_init).cookbook.should eq('runit')
        provider.send(:lsb_init).source.should eq('init.d.erb')
        provider.send(:lsb_init).variables.should have_key(:options)
        provider.send(:lsb_init).variables[:options].should eq(new_resource.options)
      end

      it 'does not create anything in the sv_dir if it is nil or false' do
        current_resource.stub!(:enabled).and_return(false)
        new_resource.stub!(:sv_templates).and_return(false)
        provider.should_not_receive(:sv_dir)
        provider.should_not_receive(:run_script)
        provider.should_not_receive(:log)
        provider.should_not_receive(:log_main_dir)
        provider.should_not_receive(:log_run_script)
        provider.send(:lsb_init).should_receive(:run_action).with(:create)
        provider.send(:service_link).should_receive(:run_action).with(:create)
        provider.run_action(:enable)
      end

      it 'creates a symlink from the sv dir to the service' do
        provider.send(:service_link).path.should eq(service_dir_name)
        provider.send(:service_link).to.should eq(sv_dir_name)
      end

      it 'enables the service with memoized resource creation methods' do
        current_resource.stub!(:enabled).and_return(false)
        provider.send(:sv_dir).should_receive(:run_action).with(:create)
        provider.send(:run_script).should_receive(:run_action).with(:create)
        provider.send(:log_dir).should_receive(:run_action).with(:create)
        provider.send(:log_main_dir).should_receive(:run_action).with(:create)
        provider.send(:log_run_script).should_receive(:run_action).with(:create)
        provider.send(:lsb_init).should_receive(:run_action).with(:create)
        provider.send(:service_link).should_receive(:run_action).with(:create)
        provider.run_action(:enable)
      end

      context 'new resource conditionals' do
        before(:each) do
          current_resource.stub!(:enabled).and_return(false)
          provider.send(:sv_dir).stub!(:run_action).with(:create)
          provider.send(:run_script).stub!(:run_action).with(:create)
          provider.send(:lsb_init).stub!(:run_action).with(:create)
          provider.send(:service_link).stub!(:run_action).with(:create)
          provider.send(:log_dir).stub!(:run_action).with(:create)
          provider.send(:log_main_dir).stub!(:run_action).with(:create)
          provider.send(:log_run_script).stub!(:run_action).with(:create)
        end

        it 'doesnt create the log dir or run script if log is false' do
          new_resource.stub!(:log).and_return(false)
          provider.should_not_receive(:log)
          provider.run_action(:enable)
        end

        it 'creates the env dir and config files if env is set' do
          new_resource.stub!(:env).and_return({'PATH' => '/bin'})
          provider.send(:env_dir).should_receive(:run_action).with(:create)
          provider.send(:env_files).should_receive(:each).once
          provider.run_action(:enable)
        end

        it 'creates the control dir and signal files if control is set' do
          new_resource.stub!(:control).and_return(['s', 'u'])
          provider.send(:control_dir).should_receive(:run_action).with(:create)
          provider.send(:control_signal_files).should_receive(:each).once
          provider.run_action(:enable)
        end

        it 'does not create the service_link on gentoo' do
          node.automatic['platform'] = 'gentoo'
          provider.should_not_receive(:service_link)
          provider.run_action(:enable)
        end
      end
    end
  end
end
