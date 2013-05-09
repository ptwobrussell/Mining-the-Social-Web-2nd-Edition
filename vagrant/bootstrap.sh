#!/usr/bin/env bash

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

# Use requirements.txt that will be included with the git checkout 
# to install all Python dependencies

cd mtsw2e
pip install -r mtsw2e-requirements.txt

# Start the IPython Notebook server
ipython notebook --ip='0.0.0.0'
