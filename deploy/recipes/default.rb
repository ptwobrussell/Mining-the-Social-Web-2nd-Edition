
include_recipe "apt"
include_recipe "runit"
include_recipe "python"
include_recipe "build-essential"
include_recipe "mongodb::10gen_repo"

package "mongodb-10gen"

service "mongodb" do
  action :enable
end

execute "mongodb_textsearch" do
  command "echo 'setParameter=textSearchEnabled=true' >> /etc/mongodb.conf"
  not_if "grep textSearchEnabled /etc/mongodb.conf"
  notifies :reload, "service[mongodb]"
end

dependencies = [
  "openjdk-6-jdk",                            # required by one of the dependencies
  "libfreetype6-dev", "libpng-dev",           # Matplotlib dependencies
  "libncurses5-dev", "vim", "git-core",
]

dependencies.each do |pkg|
  package pkg do
    action :install
  end
end

packages = [
  # Matplotlib won't install any other way right now unless you install numpy first.
  # http://stackoverflow.com/q/11797688
  "numpy==1.7.1",

  # Also need to guarantee that jpype is installed prior to boilerpipe, so just do it here
  "-e git+git://github.com/ptwobrussell/jpype.git#egg=jpype-ptwobrussell-github",
  "-e git+git://github.com/ptwobrussell/python-boilerpipe.git#egg=boilerpipe-ptwobrussell-github",

  # Relying on a fix that's in IPython master branch and not yet in a release (#2791), so we also
  # need to install IPython Notebook itself until 13.3, 1.0 or some other version includes it
  "-e git+git://github.com/ptwobrussell/ipython.git#egg=ipython-ptwobrussell-github",

  # Workaround for https://github.com/ozgur/python-linkedin/issues/11.
  # See also https://github.com/ozgur/python-linkedin/pull/12
  "-e git+git://github.com/ptwobrussell/python-linkedin.git#egg=python-linkedin-ptwobrussell-github",

  # Install FuXi per https://code.google.com/p/fuxi/wiki/Installation_Testing
  "http://cheeseshop.python.org/packages/source/p/pyparsing/pyparsing-1.5.5.tar.gz",
  "https://fuxi.googlecode.com/hg/layercake-python.tar.bz2",
  "https://pypi.python.org/packages/source/F/FuXi/FuXi-1.4.1.production.tar.gz",
]

packages.each do |package|
  python_pip package do
    action :install
  end
end

execute "install_requirements" do
  command "pip install -r /vagrant/mtsw2e-requirements.txt"
  # action :nothing
  notifies :run, "execute[download_nltk_data]"
end

# Install a few ancillary packages for NLTK in a central location. See http://nltk.org/data.html
execute "download_nltk_data" do
  command "python -m nltk.downloader -d /usr/share/nltk_data punkt maxent_treebank_pos_tagger maxent_ne_chunker words stopwords"
  action :nothing
end

runit_service "ipython" do
  default_logger true
  options({
    :port => "8888",
    :notebook_dir => "/vagrant/ipynb",
  })
end
