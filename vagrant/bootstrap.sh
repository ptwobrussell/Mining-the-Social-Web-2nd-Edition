#!/usr/bin/env bash

# Only setup the environment the first time. No need to do 
# all of these things if someone halts the VM and then brings
# it back up. Note that this provisioning shell script is 
# run as root, so there's no need to sudo.

if [ ! -d mtsw2e ]; then

    # Update
    apt-get update

    # A recent JDK is required for one of the dependencies
    apt-get install -y openjdk-6-jdk

    # These dependencies are required for matplotlib to build
    apt-get install -y libfreetype6-dev
    apt-get install -y libpng-dev

    # The lucid64 box is already running Python 2.7, so just install pip
    apt-get install -y python-pip python-dev build-essential
    pip install --upgrade pip

    # Install a necessary dependency for "pip install readline" to
    # later succeed
    apt-get install -y libncurses5-dev

    # Install git and vim
    apt-get install -y vim
    apt-get install -y git

    # Checkout code using git to the home directory as mtsw2e.
    git clone https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition.git mtsw2e

    # Change ownership of mtsw2e to vagrant:vagrant to avoid unnecessarily needing to sudo
    # to do things like launch notebooks and be able to save them
    chown -R vagrant:vagrant mtsw2e

    # Use the mtsw2e-requirements.txt that is included with the source code
    # to install all Python dependencies. A couple of them need to be handled specially...

    cd mtsw2e

    # matplotlib won't install any other way right now unless you install numpy first.
    # See http://stackoverflow.com/questions/11797688/matplotlib-requirements-with-pip-install-in-virtualenv
    pip install numpy==1.7.1 

    # Also need to guarantee that jpype is installed prior to boilerpipe, so just do it here
    pip install git+git://github.com/ptwobrussell/jpype.git#egg=jpype-ptwobrussell-github
    pip install git+git://github.com/ptwobrussell/python-boilerpipe.git#egg=boilerpipe-ptwobrussell-github

    # Relying on a fix that's in IPython master branch and not yet in a release (#2791), so we also
    # need to install IPython Notebook itself until 13.3, 1.0 or some other version includes it
    pip install git+git://github.com/ptwobrussell/ipython.git#egg=ipython-ptwobrussell-github

    pip install -r mtsw2e-requirements.txt

    # Downloading nltk stopwords for Chapters 4 & 5
    python -m nltk.downloader stopwords punkt maxent_treebank_pos_tagger maxent_ne_chunker words
else
    cd mtsw2e
    # Could optionally update the repository here with the following command (at the 
    # potential risk of introducing merge conflicts) with this command
    # git pull origin

    # For now, just log a message to the user
    echo "*********************************************************************"
    echo "Using pre-existing GitHub repository. Use 'git pull origin' to update"
    echo "*********************************************************************"
fi

# Start the IPython Notebook server
cd ipynb
# Running IPython notebook as vagrant user 
sudo -u vagrant ipython notebook --ip='0.0.0.0' --pylab=inline --no-browser &> ipython_notebook.nohup.out &
