# Description

This Chef recipe installs and configures all the dependencies for running all the notebooks from the book [Mining the Social Web (2nd Edition)][http://bit.ly/135dHfs].

This directory contains the [chef](http://www.opscode.com/chef/) recipe for provisioning a Virtualbox that takes care of installing all dependencies with Vagrant.

## Quick Start Instructions with Vagrant

You'll need to install the following software to use the _Mining the Social Web_ virtual machine:

* [Virtualbox](https://www.virtualbox.org/) - Download the latest version for your operating system.
* [Vagrant](http://www.vagrantup.com/) - We require version 1.1.2+ or later.
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf) - Once Vagrant is installed, you can type <code>vagrant plugin install vagrant-berkshelf</code> to install this Vagrant plugin.

Then, simply execute the following command and wait 10-15 minutes while a Virtualbox image downloads and configures itself:

```
$ vagrant up
```

You may need to respond to a couple of prompts to initiate the download. Don't be alarmed by any terminal output that you see which may involve some compiler warnings.

## Using With Chef

Add `mtsw2e::default` to your `run_list` if you know what you are doing. (Currently does not have any attribute.)

## Help

If you have problems running this recipe, please [file a ticket at GitHub](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/issues) or contact Mario Rodas (rodasmario2 [at] gmail [dot] com).

## Credits

Many thanks to Mario Rodas who originally wrote this recipe
