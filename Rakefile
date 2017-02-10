# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'semver'

def s_version
  SemVer.find.format "%M.%m.%p%s"
end

require 'juwelier'
Juwelier::Tasks.new do |gem|
  gem.name = "tickmarks"
  gem.homepage = "http://github.com/flajann2/tickmarks"
  gem.license = "MIT"
  gem.summary = %Q{Tickmarks generates the "mathematical" structures for mediating tick marks, for charts or anything else you may need them for.}
  gem.description = %Q{
    Tickmarks generates the "mathematical" structures for mediating tick marks,
    for, say, on a chart. Tickmarks does not generate the actual graphics -- we 
    leave that up to you. It just handles all the nuances for creating those tick 
    structures. You may use this in ways I cannot not anticipate.}
  gem.email = "fred.mitchell@gmx.de"
  gem.authors = ["Fred Mitchell"]
  gem.version = s_version

  # dependencies defined in Gemfile
end
Juwelier::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
