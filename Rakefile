Rake.application.options.trace = true

AppName = 'liquor'

require 'fileutils'
Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), 'lib', '*'))).each do |libfile|
  require libfile
end

task :build do
  desc "Build the whole project"
  Liquor.new.process :html
end

task :default => :build

task :irb do
  exec "irb -rubygems -I'lib' -r #{AppName}"
end
