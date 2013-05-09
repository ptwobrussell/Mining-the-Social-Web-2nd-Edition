#!/usr/bin/env bash

# Update
sudo apt-get update

# A recent JDK is required for one of the dependencies
sudo apt-get install -y openjdk-6-jdk

# These dependencies are required for matplotlib to build
sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y libpng-dev

# The lucid64 box is already running Python 2.7, so just install pip
sudo apt-get install -y python-pip python-dev build-essential
sudo pip install --upgrade pip

# Install a necessary dependency for "pip install readline" to
# later succeed
sudo apt-get install -y libncurses5-dev

# Install git and vim
sudo apt-get install -y vim
sudo apt-get install -y git

# Checkout code using git to the home directory as mtsw2e.
git clone https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition.git mtsw2e

# Use the mtsw2e-requirements.txt that is included with the source code
# to install all Python dependencies. A couple of them need to be handled specially...

cd mtsw2e
# matplotlib won't install any other way right now unless you install numpy first.
# See http://stackoverflow.com/questions/11797688/matplotlib-requirements-with-pip-install-in-virtualenv
pip install numpy==1.7.1 
# Also need to guarantee that jpype is installed prior to boilerpipe, so just do it here
pip install git+git://github.com/ptwobrussell/jpype.git#egg=jpype-github
pip install git+git://github.com/ptwobrussell/python-boilerpipe.git#egg=boilerpipe-github
pip install -r mtsw2e-requirements.txt

# Start the IPython Notebook server
ipython notebook --ip='0.0.0.0'
