Mining the Social Web (2nd Edition)
=================================

## Summary

The official online compendium for Mining the Social Web, 2nd Edition (O'Reilly, 2013)

_Mining the Social Web, 2nd Edition_ is currently available through O'Reilly Media's Early Access and Rough Cuts programs. The final version of the book will not be complete until the September/October timeframe, but in the meanwhile, you can [get the latest source code here and pre-order a copy of the ebook directly from O'Reilly](http://bit.ly/135dHfs). Pre-ordering through O'Reilly's Early Access program contains a number of great benefits including regular updates as the final manuscript of the book is completed as well as continual updates to the book for life! (And for a book that's built on social web APIs, rest assured that API changes will occasionally require the text of the book and examples to be updated.)

There's an incredible turn-key virtual machine experience for this second edition of the book ([see complete details below](#the-mining-the-social-web-virtual-machine-experience)) that provides you with the ability to explore and run all of the source code in a hassle-free manner. All that you have to do is follow a few simple steps to get the virtual machine installed, and you'll be off to the races. The estimated burden for setting all of this up is about 15 minutes, and it is strongly recommended that you first take advantage of use the virtual machine before attempting to run the samples on your own.

_Note that the virtual machine for this book is designed to install every single dependency for you automatically and save you a lot of time, even if you are a fairly sophisticated power user. Please try it out._

If you experience any problems at all, file an issue here on GitHub. Be sure to also follow [@SocialWebMining](http://twitter.com/socialwebmining) on Twitter and like http://facebook.com/MiningTheSocialWeb on Facebook.

## Product Description for the Book

The source code in this repository is free for your use whether or not you have a copy of the book, but it does generally assume that you are following along with the book where some valuable explanations and extended discussion of the source code occurs. The book is probably your single best source of support for questions you will have about the code or things that it does. Its product description from the publisher follows:

With this Early Access edition of Mining the Social Web (2nd Ed), you'll get access the author's raw and unedited content as he finishes writing so that you can take advantage of this powerful content long before the official release. You'll be able to influence and shape the final manuscript of the book by leaving the author direct feedback, and you'll also receive updates when significant changes are made, new chapters as they're written, and the final ebook bundle once it's available.

Facebook, Twitter, LinkedIn, Google+, and other social web properties generate a wealth of valuable social data, but how can you tap into this data and discover who’s connecting with whom, which insights are lurking just beneath the surface, and what people are talking about? This book shows you how to answer these questions and many more. Each chapter combines popular and useful social web data with analysis techniques and visualization to help you find the needles in the social haystack that you've been looking for—as well as many you probably didn't even know existed. 

In this expanded and thoroughly revised second edition you’ll learn how to:

* Navigate the most popular social web APIs to access, collect, analyze, and visualize social web data
* Employ IPython Notebook and other easy to use Python packages such as the Natural Language Toolkit, NetworkX, and Matplotlib to efficiently sift through social web data as part of an experimentally-driven approach to discovering insights in social web data
* Apply advanced text-mining techniques such as TF-IDF, cosine similarity, collocation analysis, document summarization, and clique detection to human language data that you'll encounter all over the web
* Bootstrap interest graphs by discovering latent affinities between people, programming languages, and coding projects from GitHub data
* Visualize social web data with D3, a state-of-the-art HTML5 and JavaScript toolkit

The book's source code is maintained here in this GitHub repository by its author and can be deployed as turn-key virtual machine with each chapter's source code presented in an interactive and easy to use IPython Notebook format. No complex third-party installations or advanced Python knowledge is required to get the most out of this book.

## Preview the IPython Notebooks

This edition of Mining the Social Web extensively uses [IPython Notebook](http://ipython.org/notebook.html) to facilitate the learning and development process, and the best way to preview the source code is with the links below. Chapters that aren't hyperlinked yet will be available as soon as that content is available in the ebook through [O'Reilly Media's Early Access](http://bit.ly/135dHfs). All source code is estimated to appear in this repository by mid-June 2013.

### Part I
* [Chapter 0](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter0.ipynb) - Welcome!
* [Chapter 1](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter1.ipynb) - Mining the Twitterverse: Exploring Trending Topics, Discovering What People Are Talking About, and More
* [Chapter 2](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter2.ipynb) - Mining Facebook's Social Graph: Analyzing Fan Pages, Examining Friendships, and More
* [Chapter 3](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter3.ipynb) - Mining Your LinkedIn Professional Network: Faceting Job Titles, Clustering Colleagues, and More
* [Chapter 4](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter4.ipynb) - Mining Google+ Activities: Computing Document Similarity, Extracting Collocations, and More
* [Chapter 5](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter5.ipynb) - Mining Web Pages: Using Natural Language Processing to Understand Human Language, Summarize Blog Posts and More
* [Chapter 6](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter6.ipynb) - Mining Mailboxes: Analyzing Who's Talking To Whom About What, How Often, and More
* Chapter 7 - Mining GitHub Social Coding Projects: Inspecting Software Collaboration Habits, Building Interest Graphs, and More
* [Chapter 8](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter8.ipynb) - Mining the Semantically Marked-Up Web: Extracting Microformats, Inferencing Over RDF, and More

### Part II 
* [Chapter 9](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter9.ipynb) - Twitter Recipes

### Appendices
* [Appendix B](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_AppendixB.ipynb) - OAuth Primer

## The _Mining the Social Web_ Virtual Machine Experience

The code for _Mining the Social Web_ is organized by chapter in an [IPython Notebook](http://ipython.org/notebook.html) format to maximize enjoyment of following along with examples as part of an interactive experience. Unfortunately, some of the Python dependencies for the example code can be a little bit tricky to get installed and configured, so providing a completely turn-key virtual machine to make your reading experience as simple and enjoyable as possible is in order. Even if you are a seasoned developer, you may still find some value in using this virtual machine to get started in order to save yourself some time because it's powered with [Vagrant](http://vagrantup.com/), an amazing development tool that you'll probably want to know about and arguably makes working with virtualization even easier than a native [Virtualbox](http://www.virtualbox.org/), VMWare image, etc. -- and it is probably still the fastest way to get started given some of the dependency chains with packages that can be a little more troublesome than others such as matplotlib. After all, you're more interested in following along and learning from the example code than learning how to install and manage system dependencies, right?

In order to start the virtual machine, there are just a few easy steps to follow:

* Download and install the latest copy of VirtualBox for your operating system at https://www.virtualbox.org/
* Download and install Vagrant for your operating system at http://www.vagrantup.com/
 * It is highly recommended that you take a moment to read its excellent "Getting Started" guide as a matter of initial familiarization
* Checkout this code repository to your machine using git or with the download links at the top of the main GitHub page.
* Navigate to the 'vagrant' directory in the checkout
* Run the following command: <code>vagrant up</code>

**You may benefit from watching this [short ~4 minute screencast](https://www.youtube.com/watch?v=0m0PI9TGf3w) that summarizes the steps involved in getting started.**

A few additional details once the virtual machine is running:

* What should happen at this point is that Vagrant will use the Vagrantfile that's provided to download a Virtualbox base image and use the commands in the bootstrap.sh script to customize it by installing dependencies that are needed and checking out the latest copy of this GitHub repository. The first time you <code>vagrant up</code>, it may take a few minutes since a base image and updates for it must be downloaded and installed.
* When all of the dependencies are installed, it will start the [IPython Notebook](http://ipython.org/notebook.html) server automatically
* Now, point your web browser to http://localhost:8888 and read the instructions in the Chapter0 (Welcome) IPython Notebook to get started running the code!
* Ultimately, it would be wise to learn how to <code>vagrant ssh</code> into the virtual machine and get comfortable starting/stopping IPython Notebook servers as needed, so again, it's worthwhile to take a moment to familiarize yourself with Vagrant and how to run IPython Notebook. In short, execute <code>ipython notebook --ip='0.0.0.0' --pylab=inline --no-browser</code> in any directory containing a pynb file if you need to do this for whatever reason.
* If you want to take a break from the excitement, use the <code>vagrant suspend</code> command to save the current running state of your virtual machine and stop it. To resume working again, simply issue a <code>vagrant resume</code>. Additional documentation on operating vagrant can be found [here](http://docs.vagrantup.com/v2/getting-started/teardown.html).
* If you still aren't convinced that the virtual machine will save you time, at least do yourself the favor of reviewing the [bootstrap.sh](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/blob/master/vagrant/bootstrap.sh) file that describes the steps required to get a good environment working with a minimal Linux base image.

Please file tickets here on GitHub if you experience any troubles whatsoever. The goal is to provide you with a completely turn-key system so that you can get the most out of Mining the Social Web -- not to divert your attention into unnecessary system configuration issues. 

Disclaimer: tech support will be provided as time allows for anyone who needs it, but requests filed by readers of [_Mining the Social Web, 2nd Edition_](http://bit.ly/135dHfs) will necessarily take priority as a matter of professional courtesy.
