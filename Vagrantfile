# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
   config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Map through port 8888 for IPython Notebook
  config.vm.network :forwarded_port, host: 8888, guest: 8888

  # Map through port 5000, which is what Flask uses by default
  config.vm.network :forwarded_port, host: 5000, guest: 5000

  # Map through MongoDB ports
  config.vm.network :forwarded_port, host: 27017, guest: 27017
  config.vm.network :forwarded_port, host: 27018, guest: 27018
  config.vm.network :forwarded_port, host: 27019, guest: 27019
  config.vm.network :forwarded_port, host: 28017, guest: 28017

  # Setup a shared folder to make it simple to access data
  # that's on the host machine from the IPython Notebook 
  # server that's running on the guest VM without needing to ssh
  # e.g. any files copied into the "share" folder in this same
  # directory where the Vagrantfile is located are available
  # on the VM through "/home/vagrant/share/"
  config.vm.synced_folder "../", "/home/vagrant/share/"

  # Bootstrap
  config.vm.provision :shell, :path => "bootstrap.sh"

end
