Mining the Social Web (2nd Edition)
=================================

## Summary

The official online compendium for Mining the Social Web, 2nd Edition (O'Reilly, 2013)

_Mining the Social Web, 2nd Edition_ is currently available through O'Reilly Media's Early Access and Rough Cuts programs. The final version of the book will not be complete until the September/October timeframe, but in the meanwhile, you can [get the latest source code here and pre-order a copy of the ebook directly from O'Reilly](http://bit.ly/135dHfs). Pre-ordering through O'Reilly's Early Access program contains a number of great benefits including regular updates as the final manuscript of the book is completed as well as continual updates to the book for life! (And for a book that's built on social web APIs, rest assured that API changes will occasionally require the text of the book and examples to be updated.)

There's an incredible turn-key virtual machine experience for this second edition of the book ([see complete details below](#the-mining-the-social-web-virtual-machine-experience)) that provides you with the ability to explore and run all of the source code in a hassle-free manner. All that you have to do is follow a few simple steps to get the virtual machine installed, and you'll be off to the races. The estimated burden for setting all of this up is less than 30 minutes, and it is strongly recommended that you first take advantage of use the virtual machine before attempting to run the samples on your own.

_Note that the virtual machine for this book is designed to install every single dependency for you automatically and save you a lot of time, even if you are a fairly sophisticated power user. Please try it out._

If you experience any problems at all, file an issue here on GitHub. Be sure to also follow [@SocialWebMining](http://twitter.com/socialwebmining) on Twitter and like http://facebook.com/MiningTheSocialWeb on Facebook.

## The _Mining the Social Web_ Wiki

This project takes advantage of its GitHub repository's [wiki](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/wiki) to act as a point of collaboration for consumers of the source code. Feel free to use the wiki however you'd like to share your experiences, and create additional pages as needed to curate additional information.

One of the more important wiki pages that you may want to bookmark is the [Advisories](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/wiki/Advisories) page, which is an archive of notes about particularly  disruptive commits or other changes that may affect you.

## Preview the IPython Notebooks

This edition of _Mining the Social Web_ extensively uses [IPython Notebook](http://ipython.org/notebook.html) to facilitate the learning and development process. If you're interested in what the example code for any particular chapter does, the best way to preview it is with the links below. When you're ready to develop, pull the source for this GitHub repository and follow the instructions for installing the virtual machine to get started.

* [Chapter 0 - Preface](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 0 - Preface.ipynb)
* [Chapter 1 - Mining Twitter: Exploring Trending Topics, Discovering What People Are Talking About, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 1 - Mining Twitter.ipynb)
* [Chapter 2 - Mining Facebook: Analyzing Fan Pages, Examining Friendships, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 2 - Mining Facebook.ipynb)
* [Chapter 3 - Mining LinkedIn: Faceting Job Titles, Clustering Colleagues, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 3 - Mining LinkedIn.ipynb)
* [Chapter 4 - Mining Google+: Computing Document Similarity, Extracting Collocations, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 4 - Mining Google+.ipynb)
* [Chapter 5 - Mining Web Pages: Using Natural Language Processing to Understand Human Language, Summarize Blog Posts and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 5 - Mining Web Pages.ipynb)
* [Chapter 6 - Mining Mailboxes: Analyzing Who's Talking To Whom About What, How Often, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 6 - Mining Mailboxes.ipynb)
* [Chapter 7 - Mining GitHub: Inspecting Software Collaboration Habits, Building Interest Graphs, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 7 - Mining GitHub.ipynb)
* [Chapter 8 - Mining the Semantically Marked-Up Web: Extracting Microformats, Inferencing Over RDF, and More](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 8 - Mining the Semantically Marked-Up Web.ipynb)
* [Chapter 9 - Twitter Cookbook](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/Chapter 9 - Twitter Cookbook.ipynb)
* [Appendix A - Virtual Machine Experience](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_Appendix A - Virtual Machine Experience.ipynb)
* [Appendix B - OAuth Primer](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_Appendix B - OAuth Primer.ipynb)
* [Appendix C - Python & IPython Notebook Tips](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_Appendix C - Python & IPython Notebook Tips.ipynb)

## The _Mining the Social Web_ Virtual Machine Experience

The code for _Mining the Social Web_ is organized by chapter in an [IPython Notebook](http://ipython.org/notebook.html) format to maximize enjoyment of following along with examples as part of an interactive experience. Unfortunately, some of the Python dependencies for the example code can be a little bit tricky to get installed and configured, so providing a completely turn-key virtual machine to make your reading experience as simple and enjoyable as possible is in order. Even if you are a seasoned developer, you may still find some value in using this virtual machine to get started in order to save yourself some time because it's powered with [Vagrant](http://vagrantup.com/), an amazing development tool that you'll probably want to know about and arguably makes working with virtualization even easier than a native [Virtualbox](http://www.virtualbox.org/), VMWare image, etc.  

You're more interested in following along and learning from the example code than learning how to install and manage system dependencies, right? Just follow the instructions described in  [Appendix A - Virtual Machine Experience](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_Appendix A - Virtual Machine Experience.ipynb) and streamline you troubles.

## "Premium Support"

The source code in this repository is free for your use however you'd like. If you'd like to complete a more rigorous study about social web mining much like you would experience by following along with a textbook in a classroom, however, you should consider picking up a copy of [Mining the Social Web](http://bit.ly/135dHfs) and follow along. _Think of the book as offering a form of "premium support" for this open source project._ The publisher's description of the book follows for your convenience:

With this Early Access edition of Mining the Social Web (2nd Ed), you'll get access the author's raw and unedited content as he finishes writing so that you can take advantage of this powerful content long before the official release. You'll be able to influence and shape the final manuscript of the book by leaving the author direct feedback, and you'll also receive updates when significant changes are made, new chapters as they're written, and the final ebook bundle once it's available.

Facebook, Twitter, LinkedIn, Google+, and other social web properties generate a wealth of valuable social data, but how can you tap into this data and discover who’s connecting with whom, which insights are lurking just beneath the surface, and what people are talking about? This book shows you how to answer these questions and many more. Each chapter combines popular and useful social web data with analysis techniques and visualization to help you find the needles in the social haystack that you've been looking for—as well as many you probably didn't even know existed. 

In this expanded and thoroughly revised second edition you’ll learn how to:

* Navigate the most popular social web APIs to access, collect, analyze, and visualize social web data
* Employ IPython Notebook and other easy to use Python packages such as the Natural Language Toolkit, NetworkX, and Matplotlib to efficiently sift through social web data as part of an experimentally-driven approach to discovering insights in social web data
* Apply advanced text-mining techniques such as TF-IDF, cosine similarity, collocation analysis, document summarization, and clique detection to human language data that you'll encounter all over the web
* Bootstrap interest graphs by discovering latent affinities between people, programming languages, and coding projects from GitHub data
* Visualize social web data with D3, a state-of-the-art HTML5 and JavaScript toolkit

The book's source code is maintained here in this GitHub repository by its author and can be deployed as turn-key virtual machine with each chapter's source code presented in an interactive and easy to use IPython Notebook format. No complex third-party installations or advanced Python knowledge is required to get the most out of this book.
