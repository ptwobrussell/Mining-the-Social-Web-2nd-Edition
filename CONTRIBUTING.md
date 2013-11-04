Before you file an issue...
=================================

Thanks for taking the time to file an issue! I want you to know that I'll do everything I possibly can to support you in as timely a manner as possible. Assuming I am not traveling or on vacation, I typically am able to respond to tickets within ~24 hours (and oftentimes much sooner.)

My goal to get you up and running as quickly as possible, and in order to help me serve you best, please read this document carefully. It specifically requests a few pieces of information that are necessary for almost any troubleshooting situation.

## Troubleshooting the Virtual Machine Installation

* _Are you following Appendix A exactly as prescribed?_ If you are filing a ticket to request help with the installation/configuration of your Virtual Machine, please ensure that you have first attempted to follow the instructions exactly as prescribed in [Appendix A](https://rawgithub.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/html/_Appendix A - Virtual Machine Experience.html), which is designed to provide the clearest possible instructions and includes an embedded video that illustrates the step-by-step instructions.

* _Are you receiving a specific error message while attempting installation?_ If you are experiencing a particular error with one of the primary steps involved, please be as clear as possible in describing which step is causing the error and any particular error messages that you are receiving. *Screenshots are particularly helpful since they provide some additional context as to what might be happening.*

* _What versions of the software are you using?_ Please provide the specific version of Virtualbox and Vagrant that you have installed or are attempting to install.

* _You Can't Connect to IPython Notebook?_ If you believe that you have completed all of the steps as described in Appendix A, but you are unable to connect to IPython Notebook when you access http://localhost:8888 in your browser, please copy/paste the *full output* from the console into a [pastebin](http://pastebin.com/) and include the link in your ticket. Your paste should include everythin between when you typed "vagrant up" and when your console returned back a prompt to you.

## Other Troubleshooting

If you are having a problem with a specific code example, then this section is for you.

* _Are you using the virtual machine?_ Please tell me if you have successfully installed the virtual machine as described in Appendix A or if you have chosen to install/configure your own IPython Notebook. 
 * What version of IPython is running and what are the command line options that you used to start it?
 * What operating system are you using?
 * What libraries are you using? (If you are using pip, typing "pip freeze" in a terminal will provide version information of all libraries that you can easily copy/paste into the ticket.)

* _Are you having trouble executing a specific code example?_ Please be as clear as possible in describing the problem you are having and include the example number that is causing the problem along with any specific error messages such as a stack trace. If there is any ambiguity in what is going on, the inclusion of a screenshot would be especially appreciated.
