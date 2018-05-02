# -*- mode: ruby -*-
# vi: set ft=ruby :

###########################################################################
# This configuration file is the starting point for understanding how the
# virtual machine is configured and provides a default provider that uses
# Virtualbox to provide virtualization. It also contains an *experimental*
# provider for using an AWS EC2 microinstance in the cloud. The AWS provider
# works but is a bit bleeding edge and incomplete from the standpoint of
# providing all of the functionality that it should at this time, so it should
# only be used by hackers who are comfortable working in the cloud. After 
# filling in the necessary AWS credentials below use the --provider=aws
# option to use the AWS provider. See https://github.com/mitchellh/vagrant-aws 
# for more details.
#
# See http://docs.vagrantup.com/v2/vagrantfile/index.html for additional 
# details on Vagrantfile configuration in general.
###########################################################################

Vagrant.configure("2") do |config|

  # SSH forwarding: See https://help.github.com/articles/using-ssh-agent-forwarding
  config.ssh.forward_agent = true

  #########################################################################
  # Virtualbox configuration - the default provider for running a local VM
  #########################################################################
  
  config.vm.provider :virtualbox do |vb, override|

    # The Virtualbox image
    override.vm.box = "precise64"
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"

    # Port forwarding details
  
    # Note: Unfortunately, port forwarding currently is not implemented for
    # the AWS provider plugin, so you'll need to manually open them through the 
    # AWS console or with the EC2 CLI tools. (It would be possible to do it
    # all through an additional Chef recipe that runs as part of MTSW2E, but
    # just isn't implemented yet.) Only port 8888 is essential
    # to initially access IPython Notebook and get started.

    # IPython Notebook
    override.vm.network :forwarded_port, host: 8888, guest: 8888

    # Flask
    override.vm.network :forwarded_port, host: 5000, guest: 5000

    # MongoDB
    override.vm.network :forwarded_port, host: 27017, guest: 27017
    override.vm.network :forwarded_port, host: 27018, guest: 27018
    override.vm.network :forwarded_port, host: 27019, guest: 27019
    override.vm.network :forwarded_port, host: 28017, guest: 28017
    
    # You can increase the default amount of memory used by your VM by
    # adjusting this value below (in MB) and reprovisioning.
    vb.customize ["modifyvm", :id, "--memory", "384"]
  end
 
  #########################################################################
  # AWS configuration - an experimental provider for running this VM in the
  # cloud. See https://github.com/mitchellh/vagrant-aws for configuration
  # details. User specific values for your own environment are referenced
  # here as MTSW_ environment variables that you could set (or hard code.)
  #########################################################################
  
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['MTSW_AWS_ACCESS_KEY_ID']
    aws.secret_access_key = ENV['MTSW_AWS_SECRET_ACCESS_KEY']
    aws.keypair_name = ENV['MTSW_KEYPAIR_NAME']

    # A Precise64 Ubuntu image that will run as a microinstance in the
    # region specified
    aws.ami = "ami-fb68f8cb" 
    aws.region = "us-west-2"
    aws.instance_type = "t1.micro"

    override.vm.box = "aws"
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV['MTSW_KEYPAIR_PATH']

    # "vagrant plugin install omnibus" to get Chef-Solo on vanilla AMI
    override.omnibus.chef_version = "11.6.0"
  end

  # Chef-Solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = "deploy/cookbooks"
    chef.json = {
      :answer => "42",
    }
    chef.run_list = [
      "recipe[mtsw2e::default]"
    ]
  end

end
