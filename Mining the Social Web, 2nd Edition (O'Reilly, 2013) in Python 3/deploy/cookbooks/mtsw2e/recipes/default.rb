
include_recipe "apt"
include_recipe "runit"
include_recipe "python"

apt_repository "mongodb-10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
  action :add
end

dependencies = [
  "mongodb-10gen",                            # Mongodb from 10gen
  "openjdk-6-jdk",                            # required by one of the dependencies
  "libfreetype6-dev", "libpng-dev",           # Matplotlib dependencies
  "libncurses5-dev", "vim", "git-core",
  "build-essential",
]

dependencies.each do |pkg|
  package pkg do
    action :install
  end
end

service "mongodb" do
  action [:enable, :start]
end

execute "mongodb_textsearch" do
  command "echo 'setParameter = textSearchEnabled=true' >> /etc/mongodb.conf"
  not_if "grep textSearchEnabled /etc/mongodb.conf"
  notifies :restart, "service[mongodb]", :immediately
end

packages = [
  # Matplotlib won't install any other way right now unless you install numpy first.
  # http://stackoverflow.com/q/11797688
  "numpy==1.7.1",

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
  command "pip install -r /vagrant/mtsw2e-requirements.txt --allow-unverified matplotlib --allow-all-external"
  # action :nothing
end

# Install a few ancillary packages for NLTK in a central location. See http://nltk.org/data.html
#
# XXX:
# TEMPORARILY COMMENTING THESE DOWNLOADS OUT UNTIL CHEF HANDLING CAN BE ADDED TO IGNORE A 
# Mixlib::ShellOut::CommandTimeout ERROR DUE TO BANDWIDTH LIMITATIONS. TOO MANY READERS ARE
# INTERMITTENTLY EXPERIENCING THIS PROBLEM AND HAVING TO WORKAROUND THE IT. SINCE THERE ARE
# CUES TO DOWNLOAD THESE ADD-ONS IN THE NOTEBOOKS THAT REQUIRE THEM, IT SEEMS BETTER TO
# AVOID THE ISSUE ALL TOGETHER AT THIS PARTICULAR JUNCTURE.
#
#"punkt maxent_treebank_pos_tagger maxent_ne_chunker words stopwords".each_line do |data|
#  execute "download_nltk_#{data}" do
#    command "python -m nltk.downloader -d /usr/share/nltk_data #{data}"
#    not_if do
#      ::File.exists?("/usr/share/nltk_data/#{data}")
#    end
#  end
#end

runit_service "ipython" do
  default_logger true
  options({
    :port => "8888",
    :notebook_dir => "/vagrant/ipynb",
  })
end
