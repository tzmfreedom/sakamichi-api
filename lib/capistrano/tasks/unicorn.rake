namespace :unicorn do
  task :start  do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if test("[ -e #{pidfile} ] && kill -0 #{pid}")
          info "unicorn is runnning with pid: #{pid}"
        else
          execute :mkdir, "-p #{current_path}/tmp/pids"
          with rails_env: fetch(:rails_env) do
            unicorn_rack_env = fetch(:rails_env) == "development" ? "development" : "deployment"
            execute :bundle, "exec unicorn -c #{config_path} -E #{unicorn_rack_env} -D"
          end
        end
      end
    end
  end

  task :stop do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if test("[ -e #{pidfile} ]")
          if test("kill -0 #{pid}")
            execute :kill, "-QUIT #{pid}"
          else
            execute :rm, pidfile
          end
        else
          info "unicorn is not runnning"
        end
      end
    end
  end

  task :reload do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if test("[ -e #{pidfile} ] && kill -0 #{pid}")
          execute :kill, "-HUP #{pid}"
        else
          info "unicorn is not runnning"
        end
      end
    end
  end

  task :restart do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if test("[ -e #{pidfile} ]")
          if test("kill -0 #{pid}")
            execute :kill, "-USR2 #{pid}"
          else
            execute :rm, pidfile
            invoke 'unicorn:start'
          end
        else
          invoke 'unicorn:start'
        end
      end
    end
  end
end

def pidfile
  File.join(current_path, "tmp", "pids", "unicorn.pid")
end

def pid
  "`cat #{pidfile}`"
end

def config_path
  File.join(current_path, "config", "unicorn", "#{fetch(:rails_env)}.rb")
end
