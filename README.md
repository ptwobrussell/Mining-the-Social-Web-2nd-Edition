Mining-the-Social-Web-2nd-Edition
=================================

## Summary

The official online compendium for Mining the Social Web, 2nd Edition (O'Reilly, 2013)

_Mining the Social Web, 2nd Edition_ is currently available through O'Reilly Media's Early Access and Rough Cuts programs. The final version of the book will not be complete until the September/October timeframe, but in the meanwhile, you can get the latest source code here and pre-order a copy of the ebook directly from O'Reilly at http://shop.oreilly.com/product/0636920030195.do 

Pre-ordering through O'Reilly's Early Access program contains a number of great benefits including regular updates as the final manuscript of the book is completed as well as continual updates to the book for life! (And for a book that's built on social web APIs, rest assured that API changes will occasionally require the text of the book and examples to be updated.)

Whatever you choose to do, be sure to follow [@SocialWebMining](http://twitter.com/socialwebmining) on Twitter and stay connected on Facebook by liking http://facebook.com/MiningTheSocialWeb

## The Mining the Social Web Virtual Machine

Some of the Python dependencies for _Mining the Social Web_ can be a little bit tricky to get installed and configured, so a turn-key VirtualBox virtual machine is available with all of the dependencies pre-loaded and ready to go. Even if you are a seasoned developer, you may still find some value in using this virtual machine to get started in order to save yourself some time. After all, you're more interested in following along and learning from the example code than learning how to install and manage system dependencies, right?

In order to use the virtual machine, there are just a few easy steps to follow:

* Download the latest copy of VirtualBox for your operating system at https://www.virtualbox.org/
* Download and unzip the pre-built virtual machine for _Mining the Social Web_ from XXX.
* Start the virtual machine with the VirtualBox GUI console that you've already downloaded and installed by clicking on the ovf file in the download or by importing it through the Virtualbox console's "Machine -> Add..." menu.
** When prompted, login with vagrant/vagrant as the login/password to login to the machine.
* Start the IPython Notebook server in the ~/mtsw2e directory or any of the subdirectories containing an ipynb file by typing the following commands: 
** cd ~/mtsw2e
** ipython notebook --ip='0.0.0.0'
* Now, point your web browser to http://localhost:8888 and read the instructions in the 'Welcome' IPython Notebook to get started with the code!
* Note that if you need to change any network settings to pass through port 8888 on the VirtualBox to another port on your machine, you an do so through the Virtualbox GUI console by clicking on the "Port Forwarding" button that appears on the active network adapter's tab that is displayed when you click on the "Network" pane or select the "Settings..." contextual menu by right clicking on a Virtualbox. Typical settings would be to forward 0.0.0.0:8888 on the guest machine (the Virtualbox) to 0.0.0.0:8888 on the host  machine (your computer.)
