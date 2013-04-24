require 'daemons'
 
pwd = File.dirname(__FILE__)
Daemons.run_proc('run.rb', {:dir_mode => :normal, :dir => "/home/zadr/adcrss", :log_dir => pwd, :log_output => true}) do
  Dir.chdir(pwd)
  exec 'ruby -rubygems run.rb'
end
