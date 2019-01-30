Description
===========

Installs and configures Python.  Also includes LWRPs for managing python packages with `pip` and `virtualenv` isolated Python environments.

Requirements
============

Platform
--------

* Debian, Ubuntu
* CentOS, Red Hat, Fedora

Cookbooks
---------

* build-essential
* yum

NOTE: The `yum` cookbook is a dependency of the cookbook, and will be used to install [EPEL](http://fedoraproject.org/wiki/EPEL) on RedHet/CentOS 5.x systems to provide the Python 2.6 packages.

Attributes
==========

See `attributes/default.rb` for default values.

* `node["python"]["install_method"]` - method to install python with, default `package`.

The file also contains the following attributes:

* platform specific locations and settings.
* source installation settings

Resource/Provider
=================

This cookbook includes LWRPs for managing:

* pip packages
* virtualenv isolated Python environments

`python_pip`
------------

Install packages using the new hotness in Python package management...[`pip`](http://pypi.python.org/pypi/pip).  Yo dawg...easy_install is so 2009, you better ask your local Pythonista if you don't know! The usage semantics are like that of any normal package provider.

# Actions

- :install: Install a pip package - if version is provided, install that specific version (default)
- :upgrade: Upgrade a pip package - if version is provided, upgrade to that specific version
- :remove: Remove a pip package
- :user: User to run pip as, for using with virtualenv
- :group: Group to run pip as, for using with virtualenv
- :purge: Purge a pip package (this usually entails removing configuration files as well as the package itself).  With pip packages this behaves the same as `:remove`

# Attribute Parameters

- package_name: name attribute. The name of the pip package to install
- version: the version of the package to install/upgrade.  If no version is given latest is assumed.
- virtualenv: virtualenv environment to install pip package into
- options: Add additional options to the underlying pip package command
- timeout: timeout in seconds for the command to execute. Useful for pip packages that may take a long time to install. Default 900 seconds.

# Example

    # install latest gunicorn into system path
    python_pip "gunicorn"

    # target a virtualenv
    python_pip "gunicorn" do
      virtualenv "/home/ubunut/my_ve"
    end

    # install Django 1.1.4
    python_pip "django" do
      version "1.1.4"
    end

    # use this provider with the core package resource
    package "django" do
      provider Chef::Provider::PythonPip
    end

`python_virtualenv`
-------------------

[`virtualenv`](http://pypi.python.org/pypi/virtualenv) is a great tool that creates isolated python environments.  Think of it as RVM without all those hipsters and tight jeans.

# Actions

- :create: creates a new virtualenv
- :delete: deletes an existing virtualenv

# Attribute Parameters

- path: name attribute. The path where the virtualenv will be created
- interpreter: The Python interpreter to use. default is `python2.6`
- owner: The owner for the virtualenv
- group: The group owner of the file (string or id)
- options : Command line options (string)

# Example

    # create a 2.6 virtualenv owned by ubuntu user
    python_virtualenv "/home/ubuntu/my_cool_ve" do
      owner "ubuntu"
      group "ubuntu"
      action :create
    end

    # create a Python 2.4 virtualenv
    python_virtualenv "/home/ubuntu/my_old_ve" do
      interpreter "python2.4"
      owner "ubuntu"
      group "ubuntu"
      action :create
    end

    # create a Python 2.6 virtualenv with access to the global packages owned by ubuntu user
    python_virtualenv "/home/ubuntu/my_old_ve" do
      owner "ubuntu"
      group "ubuntu"
      options "--system-site-packages"
      action :create
    end

Usage
=====

default
-------

Include default recipe in a run list, to get `python`, `pip` and `virtualenv`. Installs python by package or source depending on the platform.

package
-------

Installs Python from packages.

source
------

Installs Python from source.

pip
---

Installs `pip` from source.

virtualenv
----------

Installs virtualenv using the `python_pip` resource.

License and Author
==================

Author:: Seth Chisamore (<schisamo@opscode.com>)

Copyright:: 2011, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
