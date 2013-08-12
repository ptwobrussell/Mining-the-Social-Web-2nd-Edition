require 'spec_helper'

describe 'apt::default' do
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new()
    runner.converge('apt::default')
  end

  it 'installs update-notifier-common' do
    expect(chef_run).to install_package 'update-notifier-common'
  end

  it 'apt-get updates' do
    expect(chef_run).to execute_command 'apt-get update'
  end

  it 'creates preseeding directory' do
    expect(chef_run).to create_directory('/var/cache/local')
    expect(chef_run).to create_directory('/var/cache/local/preseeding')
  end

end
