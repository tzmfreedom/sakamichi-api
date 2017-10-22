namespace :load do
  task :defaults do
    set :unicorn_pid_path, -> { File.join(current_path, 'tmp', 'pids', 'unicorn.pid') }
    set :unicorn_config_path, -> { File.join(current_path, 'config', 'unicorn', "#{fetch(:rails_env)}.rb") }
    set :unicorn_roles, -> { :app }
  end
end

namespace :unicorn do
  def pid
    "`cat #{fetch(:unicorn_pid_path)}`"
  end

  def pidfile_exists?
    test("[ -e #{fetch(:unicorn_pid_path)} ]")
  end

  def remove_pidfile
    execute :rm, fetch(:unicorn_pid_path)
  end

  def unicorn_running?
    test("kill -0 #{pid}")
  end

  def start_unicorn
    execute :mkdir, "-p #{File.dirname(fetch(:unicorn_pid_path))}"
    unicorn_rack_env = fetch(:rails_env) == 'development' ? 'development' : 'deployment'
    with rails_env: fetch(:rails_env) do
      execute :bundle, "exec unicorn -c #{fetch(:unicorn_config_path)} -E #{unicorn_rack_env} -D"
    end
  end

  def stop_unicorn
    execute :kill, "-QUIT #{pid}"
  end

  def reload_unicorn
    execute :kill, "-HUP #{pid}"
  end

  def restart_unicorn
    execute :kill, "-USR2 #{pid}"
  end

  task :start  do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if pidfile_exists? && unicorn_running?
          info "unicorn is runnning"
        else
          remove_pidfile if pidfile_exists?
          start_unicorn
        end
      end
    end
  end

  task :stop do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if pidfile_exists?
          unicorn_running? ? stop_unicorn : remove_pidfile
        else
          info 'unicorn is not runnning'
        end
      end
    end
  end

  task :reload do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if pidfile_exists? && unicorn_running?
          reload_unicorn
        else
          remove_pidfile if pidfile_exists?
          info 'unicorn is not runnning'
        end
      end
    end
  end

  task :restart do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if pidfile_exists?
          if unicorn_running?
            restart_unicorn
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
