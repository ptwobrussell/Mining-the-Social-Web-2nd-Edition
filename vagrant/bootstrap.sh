#!/usr/bin/env bash

# Only setup the environment the first time. No need to do 
# all of these things if someone halts the VM and then brings
# it back up. Note that this provisioning shell script is 
# run as root, so there's no need to sudo.

if [ ! -f /home/vagrant/share/vagrant/bootstrap_complete.txt ]; then

    # Update
    apt-get update

    # A recent JDK is required for one of the dependencies
    apt-get install -y openjdk-6-jdk

    # These dependencies are required for matplotlib to build
    apt-get install -y libfreetype6-dev
    apt-get install -y libpng-dev

    # The lucid64 box is already running Python 2.7, so just install pip
    # pip needs to be installed as sudo or the python packages don't work
    apt-get install -y python-pip python-dev build-essential
    sudo pip install --upgrade pip

    # Install a necessary dependency for "pip install readline" to
    # later succeed
    apt-get install -y libncurses5-dev

    # Install git and vim - not strictly necessary but possibly handy to have
    apt-get install -y vim
    apt-get install -y git

    # Move into the shared folder, which is mapped in Vagrantfile as the GitHub checkout
    # directory. It's relative path from here is ../
    cd /home/vagrant/share

    # Use the mtsw2e-requirements.txt that is included with the source code
    # to install all Python dependencies. A few things need to be handled carefully though

    # matplotlib won't install any other way right now unless you install numpy first.
    # See http://stackoverflow.com/questions/11797688/matplotlib-requirements-with-pip-install-in-virtualenv
    pip install numpy==1.7.1

    # Also need to guarantee that jpype is installed prior to boilerpipe, so just do it here
    pip install git+git://github.com/ptwobrussell/jpype.git#egg=jpype-ptwobrussell-github
    pip install git+git://github.com/ptwobrussell/python-boilerpipe.git#egg=boilerpipe-ptwobrussell-github

    # Relying on a fix that's in IPython master branch and not yet in a release (#2791), so we also
    # need to install IPython Notebook itself until 13.3, 1.0 or some other version includes it
    pip install git+git://github.com/ptwobrussell/ipython.git#egg=ipython-ptwobrussell-github

    # Workaround for https://github.com/ozgur/python-linkedin/issues/11.
    # See also https://github.com/ozgur/python-linkedin/pull/12
    pip install git+git://github.com/ptwobrussell/python-linkedin.git#egg=python-linkedin-ptwobrussell-github

    pip install -r mtsw2e-requirements.txt

    # Install a few ancillary packages for NLTK in a central location. See http://nltk.org/data.html
    python -m nltk.downloader -d /usr/share/nltk_data punkt maxent_treebank_pos_tagger maxent_ne_chunker words stopwords

    # Create a state file so that we don't do all of this again the next time the machine starts up from a halted state
    echo "If you delete this file, the Vagrant box will re-install all of its dependencies from a halted state" >>  vagrant/bootstrap_complete.txt
fi
    
# Start the IPython Notebook server
cd /home/vagrant/share/ipynb

# Running IPython notebook 
ipython notebook --ip='0.0.0.0' --pylab=inline --no-browser &> ipython_notebook.nohup.out &
