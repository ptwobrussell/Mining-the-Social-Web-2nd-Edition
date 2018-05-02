require 'spec_helper'

describe 'apt::cacher-client' do

  context 'no server' do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new
      runner.converge('apt::cacher-client')
    end

    it 'does not create 01proxy file' do
      expect(chef_run).not_to create_file('/etc/apt/apt.conf.d/01proxy')
    end
  end

  context 'server provided' do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new
      runner.node.set['apt']['cacher_ipaddress'] = '22.33.44.55'
      runner.node.set['apt']['cacher_port'] = '9876'
      runner.converge('apt::cacher-client')
    end

    it 'creates 01proxy file' do
      expect(chef_run).to create_file('/etc/apt/apt.conf.d/01proxy')
      expect(chef_run).to create_file_with_content('/etc/apt/apt.conf.d/01proxy', 'Acquire::http::Proxy "http://22.33.44.55:9876";')
    end

  end

end
