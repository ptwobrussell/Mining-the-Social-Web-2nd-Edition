Mining the Social Web (2nd Edition)
=================================

## Summary

The official online compendium for Mining the Social Web, 2nd Edition (O'Reilly, 2013)

_Mining the Social Web, 2nd Edition_ is currently available through O'Reilly Media's Early Access and Rough Cuts programs. The final version of the book will not be complete until the September/October timeframe, but in the meanwhile, you can get the latest source code here and pre-order a copy of the ebook directly from O'Reilly at http://shop.oreilly.com/product/0636920030195.do 

Pre-ordering through O'Reilly's Early Access program contains a number of great benefits including regular updates as the final manuscript of the book is completed as well as continual updates to the book for life! (And for a book that's built on social web APIs, rest assured that API changes will occasionally require the text of the book and examples to be updated.)

Whatever you choose to do, be sure to follow [@SocialWebMining](http://twitter.com/socialwebmining) on Twitter and stay connected on Facebook by liking http://facebook.com/MiningTheSocialWeb

## The _Mining the Social Web_ Virtual Machine

Some of the Python dependencies for _Mining the Social Web_ can be a little bit tricky to get installed and configured, so providing a completely turn-key virtual machine to make your reading experiene as simple and enjoyable as possible is in order. Even if you are a seasoned developer, you may still find some value in using this virtual machine to get started in order to save yourself some time because it's powered with Vagrant, an amazing development tool that you'll probably want to know about and arguably makes working with virtualization even easier than a native Virtualbox or VMWare image, and it is probably still the fastest way to get started given some of the dependency chains with packages that can be a little more troublesome than others such as matplotlib. After all, you're more interested in following along and learning from the example code than learning how to install and manage system dependencies, right?

In order to use the virtual machine, there are just a few easy steps to follow:

* Download and install the latest copy of VirtualBox for your operating system at https://www.virtualbox.org/
* Download and install Vagrant for your operating system at http://www.vagrantup.com/
 * It is highly recommanded that you take a moment to read its excellent "Getting Started" guide as a matter of initial familiarization
* Checkout this code repository to your machine using git or with the download links at the top of the main GitHub page.
* Navigate to the 'vagrant' directory in the checkout
* Run the following command: <code>vagrant up</code>
 * What should happen at this point is that Vagrant will use the Vagrantfile that's provided to download a Virtualbox base image and use the commands in the bootstrap.sh script to customize it by installing dependencies that are needed and checking out the latest copy of this GitHub repository. 
 * When all of the dependencies are installed, it will start the IPython Notebook server automatically
* Now, point your web browser to http://localhost:8888 and read the instructions in the 'Welcome' IPython Notebook to get started running the code!
 * Ultimately, you'll need to run the <code>vagrant ssh</code> command to login to the virtual machine and get comfortable starting/stopping IPython Notebook servers as needed, so again, it's worthwhile to take a moment to familiarize yourself with Vagrant and how to run IPython Notebook. In short, execute <code>ipython notebook --ip='0.0.0.0'</code> in any directory containing a pynb file.

Please file tickets here on GitHub if you experience any troubles whatsoever. The goal is to provide you with a completely turn-key system so that you can get the most out of Mining the Social Web -- not to divert your attention into unnecessary system configuration issues. 

Disclaimer: tech support will be provided as time allows for anyone who needs it, but requests filed by readers of _Mining the Social Web, 2nd Edition_ will take priority.
