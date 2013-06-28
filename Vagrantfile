# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true

  # Berkshelf
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = File.join(File.dirname(__FILE__), "deploy", "Berksfile")

  # Map through port 8888 for IPython Notebook
  config.vm.network :forwarded_port, host: 8888, guest: 8888

  # Map through port 5000, which is what Flask uses by default
  config.vm.network :forwarded_port, host: 5000, guest: 5000

  # Map through MongoDB ports
  config.vm.network :forwarded_port, host: 27017, guest: 27017
  config.vm.network :forwarded_port, host: 27018, guest: 27018
  config.vm.network :forwarded_port, host: 27019, guest: 27019
  config.vm.network :forwarded_port, host: 28017, guest: 28017

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.json = {
      :answer => "42",
    }
    chef.run_list = [
      "recipe[mtsw2e::default]"
    ]
  end
end
