require 'rubygems'
require 'bundler'
Bundler.setup

require 'rake'
require 'foodcritic'
require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./test/spec{,/*/**}/*_spec.rb"
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['correctness']}
end
