# Description

This [Chef](http://www.opscode.com/chef/) recipe installs and configures all the dependencies for running all of the IPython Notebooks for [Mining the Social Web][http://miningthesocialweb.com].

See [Appendix A](http://nbviewer.ipython.org/urls/raw.github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/master/ipynb/_Appendix%20A%20-%20Virtual%20Machine%20Experience.ipynb) for details on getting started.

## Using With Chef-Solo

Create a file called *mtsw2e.json* containing the following:
`
{
  "run_list": [ "recipe[mtsw2e::default]" ]
 }
`

Create a file called *mtsw2e.rb* containing the following:
`
file_cache_path "/vagrant/deploy/chef-solo"
cookbook_path "/vagrant/deploy/cookbooks"
log_level :debug
`

## Help

If you have problems running this recipe, please [file a ticket at GitHub](https://github.com/ptwobrussell/Mining-the-Social-Web-2nd-Edition/issues)

## Credits

Many thanks to Mario Rodas (@marsam on GitHub) who originally wrote this recipe
