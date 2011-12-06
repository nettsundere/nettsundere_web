worker_processes 4

working_directory File.expand_path("../../", __FILE__)

if ENV['RACK_ENV'] == "production"
  listen "/var/www/sockets/nettsundere_unicorn.sock"

  timeout 30

  pid "/var/run/nettsundere_unicorn.pid"
  
  stderr_path "/var/log/unicorn/stderr.log"
  stdout_path "/var/log/unicorn/stdout.log"
else
  listen 3000
end
