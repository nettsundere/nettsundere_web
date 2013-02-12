set :rvm_type, :system                  
set :rvm_ruby_string, "ruby-1.9.3-head"
set :rvm_bin_path, "/usr/local/rvm/bin"        
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
set :keep_releases, 3

role :web, "rue-m.ru"
role :app, "rue-m.ru"
role :db,  "rue-m.ru", :primary => true

after 'deploy:update_code', 'config:symlink_shared'
namespace :config do
  task :symlink_shared, :roles => :web do
    run "ln -sf #{shared_path}/system/config/config.rb #{current_release}/config/config.rb"
    run "ln -sf #{shared_path}/system/config/initializers/secret_token.rb #{current_release}/config/initializers/secret_token.rb"
    run "rm -rf #{current_release}/public/uploads"
    run "ln -sf #{shared_path}/system/uploads #{current_release}/public/uploads"
  end
end

load "deploy/assets"

namespace :deploy do
  nginx = "/etc/init.d/nginx"
  unicorn = "/usr/local/rvm/gems/ruby-1.9.3-head/bin/unicorn"
  unicorn_pid_file = "/var/run/nettsundere_unicorn.pid"
  rake = "/usr/local/rvm/gems/ruby-1.9.3-head/bin/rake"
  
  task :start, :roles => :web, :on_error => :continue do
    run "cd #{current_path} && #{unicorn} -c config/unicorn.rb config.ru -E production -D"
    run "#{nginx} start"
  end
  
  task :stop, :roles => :web, :on_error => :continue do
    unicorn_pid = pid_from unicorn_pid_file   
    run "#{nginx} stop"
    run "kill -s QUIT #{unicorn_pid}"
  end
  
  task :restart, :roles => :web do
    stop
    start
  end
  
  def pid_from(file)
    capture "cat #{file}"
  end
end

after "deploy:restart", "deploy:cleanup"
