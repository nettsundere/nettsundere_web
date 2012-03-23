$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) 
require "rvm/capistrano"                  
set :rvm_ruby_string, "ruby-1.9.3-head"
set :rvm_bin_path, "/usr/local/bin"        

set :application, "nettsundere_web"

set :repository, "git@github.com:nettsundere/nettsundere_web.git"
set :scm, :git

set :ssh_options, :forward_agent => true
default_run_options[:pty] = true
set :branch, "master"
set :scm_username, "nettsundere"

set :user, "root"
set :use_sudo, false

set :deploy_to, "/var/www/nettsundere"

role :web, "rue-m.ru"
role :app, "rue-m.ru"
role :db,  "rue-m.ru", :primary => true

namespace :deploy do
  nginx = "/etc/init.d/nginx"
  unicorn = "/usr/local/rvm/gems/ruby-1.9.3-head/bin/unicorn"
  unicorn_pid_file = "/var/run/nettsundere_unicorn.pid"
  rake = "/usr/local/rvm/gems/ruby-1.9.3-head/bin/rake"
  
  task :start, :roles => :web, :on_error => :continue do
    commands = [
      "cd #{current_path} && #{unicorn} -c config/unicorn.rb config.ru -E production -D",
      "#{nginx} start"
    ]
    
    run_all commands
  end
  
  task :stop, :roles => :web, :on_error => :continue do
    unicorn_pid = pid_from unicorn_pid_file  
 
    commands = [ 
      "#{nginx} stop",
      "kill -s QUIT #{unicorn_pid}"
    ]
    
    run_all commands
  end
  
  task :restart, :roles => :web do
    stop
    start
  end
  
  def run_all(commands)
    commands.each {|command| run command}
  end
  
  # Read pid value from pidfile.
  def pid_from(file)
    capture "cat #{file}"
  end
end
