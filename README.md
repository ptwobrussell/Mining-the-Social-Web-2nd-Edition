Mining the Social Web (2nd Edition)
=================================

## Summary

The official online compendium for Mining the Social Web, 2nd Edition (O'Reilly, 2013)

_Mining the Social Web, 2nd Edition_ is currently available through O'Reilly Media's Early Access and Rough Cuts programs. The final version of the book will not be complete until the September/October timeframe, but in the meanwhile, you can [get the latest source code here and pre-order a copy of the ebook directly from O'Reilly](http://bit.ly/135dHfs). Pre-ordering through O'Reilly's Early Access program contains a number of great benefits including regular updates as the final manuscript of the book is completed as well as continual updates to the book for life! (And for a book that's built on social web APIs, rest assured that API changes will occasionally require the text of the book and examples to be updated.)

There's also an incredible turn-key virtual machine experience for this second edition of the book (see below) that provides you with all of the source code in a hassle-free manner so even if you're not interested in the book at this time, be sure to clone this repository and use the virtual machine to hack on the source code in ten minutes or less.

_Please note that the virtual machine for this book is designed to install every single dependency for you automatically and save you a lot of time, even if you are a fairly sophisticated power user. It is highly recommended that you try it out. If you choose not to use it, at least peek at the [boostrap.sh](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/blob/master/vagrant/bootstrap.sh) file that it uses so that you know what you're getting yourself into and are able to work though the issues as painlessly as possible on your own system._

Whatever you choose to do, be sure to follow [@SocialWebMining](http://twitter.com/socialwebmining) on Twitter and stay connected on Facebook by liking http://facebook.com/MiningTheSocialWeb

## Product Description for the Book

With this Early Access edition of Mining the Social Web (2nd Ed), you'll get access the author's raw and unedited content as he finishes writing so that you can take advantage of this powerful content long before the official release. You'll be able to influence and shape the final manuscript of the book by leaving the author direct feedback, and you'll also receive updates when significant changes are made, new chapters as they're written, and the final ebook bundle once it's available.

Facebook, Twitter, LinkedIn, Google+, and other social web properties generate a wealth of valuable social data, but how can you tap into this data and discover who’s connecting with whom, which insights are lurking just beneath the surface, and what people are talking about? This book shows you how to answer these questions and many more. Each chapter combines popular and useful social web data with analysis techniques and visualization to help you find the needles in the social haystack that you've been looking for—as well as many you probably didn't even know existed. 

In this expanded and thoroughly revised second edition you’ll learn how to:

* Navigate the most popular social web APIs to access, collect, analyze, and visualize social web data
* Employ IPython Notebook and other easy to use Python packages such as the Natural Language Toolkit, NetworkX, and Matplotlib to efficiently sift through social web data as part of an experimentally-driven approach to discovering insights in social web data
* Apply advanced text-mining techniques such as TF-IDF, cosine similarity, collocation analysis, document summarization, and clique detection to human language data that you'll encounter all over the web
* Bootstrap interest graphs by discovering latent affinities between people, programming languages, and coding projects from GitHub data
* Visualize social web data with D3, a state-of-the-art HTML5 and JavaScript toolkit

The book's source code is maintained here in this GitHub repository by its author and can be deployed as turn-key virtual machine with each chapter's source code presented in an interactive and easy to use IPython Notebook format. No complex third-party installations or advanced Python knowledge is required to get the most out of this book.

## The _Mining the Social Web_ Virtual Machine Experience

The code for _Mining the Social Web_ is organized by chapter in an [IPython Notebook](http://ipython.org/notebook.html) format to maximize enjoyment of following along with examples as part of an interactive experience. Unfortunately, some of the Python dependencies for the example code can be a little bit tricky to get installed and configured, so providing a completely turn-key virtual machine to make your reading experience as simple and enjoyable as possible is in order. Even if you are a seasoned developer, you may still find some value in using this virtual machine to get started in order to save yourself some time because it's powered with [Vagrant](http://vagrantup.com/), an amazing development tool that you'll probably want to know about and arguably makes working with virtualization even easier than a native [Virtualbox](http://www.virtualbox.org/), VMWare image, etc. -- and it is probably still the fastest way to get started given some of the dependency chains with packages that can be a little more troublesome than others such as matplotlib. After all, you're more interested in following along and learning from the example code than learning how to install and manage system dependencies, right?

In order to start the virtual machine, there are just a few easy steps to follow:

* Download and install the latest copy of VirtualBox for your operating system at https://www.virtualbox.org/
* Download and install Vagrant for your operating system at http://www.vagrantup.com/
 * It is highly recommended that you take a moment to read its excellent "Getting Started" guide as a matter of initial familiarization
* Checkout this code repository to your machine using git or with the download links at the top of the main GitHub page.
* Navigate to the 'vagrant' directory in the checkout
* Run the following command: <code>vagrant up</code>

A few additional details once the virtual machine is running:

* What should happen at this point is that Vagrant will use the Vagrantfile that's provided to download a Virtualbox base image and use the commands in the bootstrap.sh script to customize it by installing dependencies that are needed and checking out the latest copy of this GitHub repository. The first time you <code>vagrant up</code>, it may take a few minutes since a base image and updates for it must be downloaded and installed.
* When all of the dependencies are installed, it will start the [IPython Notebook](http://ipython.org/notebook.html) server automatically
* Now, point your web browser to http://localhost:8888 and read the instructions in the Chapter0 (Welcome) IPython Notebook to get started running the code!
* Ultimately, it would be wise to learn how to <code>vagrant ssh</code> into the virtual machine and get comfortable starting/stopping IPython Notebook servers as needed, so again, it's worthwhile to take a moment to familiarize yourself with Vagrant and how to run IPython Notebook. In short, execute <code>ipython notebook --ip='0.0.0.0' --pylab=inline --no-browser</code> in any directory containing a pynb file if you need to do this for whatever reason.
* If you want to take a break from the excitement, use the <code>vagrant suspend</code> command to save the current running state of your virtual machine and stop it. To resume working again, simply issue a <code>vagrant resume</code>. Additional documentation on operating vagrant can be found [here](http://docs.vagrantup.com/v2/getting-started/teardown.html).

Please file tickets here on GitHub if you experience any troubles whatsoever. The goal is to provide you with a completely turn-key system so that you can get the most out of Mining the Social Web -- not to divert your attention into unnecessary system configuration issues. 

Disclaimer: tech support will be provided as time allows for anyone who needs it, but requests filed by readers of [_Mining the Social Web, 2nd Edition_](http://bit.ly/135dHfs) will necessarily take priority as a matter of professional courtesy.
