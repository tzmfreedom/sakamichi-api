listen 3000
worker_processes 4
pid "/var/www/sakamichi-api/current/tmp/pids/unicorn.pid"
timeout 10

stderr_path "/var/log/sakamichi-api/unicorn_stderr.log"
stdout_path "/var/log/sakamichi-api/unicorn_stdout.log"

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      puts e.message
      puts e.backtrace
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

