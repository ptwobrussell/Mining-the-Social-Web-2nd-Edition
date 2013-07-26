# Description

Installs and configures all the dependencies for running all the notebooks from the book [Mining the Social Web (2nd Edition)][]

This directory contains the [chef](http://www.opscode.com/chef/) recipe for provisioning a virtualbox with all dependencies and source code for Mining the Social Web, 2nd Edition by using Vagrant.

    **Note:**  
    This recipe was primarily written to be used with vagrant.

## Using with Vagrant

You need the following dependencies:

* [Vagrant](http://www.vagrantup.com/) (We require Vagrant 1.1.2+ or later).
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf) plugin.

And simply execute:

```
$ vagrant up
```

## Using With Chef

Add `mtsw2e::default` to your run_list. Currently does not have any attribute.

## Help

If you have problems running this recipe. I'll be glad to help you: `rodasmario2 [at] gmail [dot] com`.

[Mining the Social Web (2nd Edition)]: http://shop.oreilly.com/product/0636920030195.do "Mining the Social Web, 2nd Edition"
