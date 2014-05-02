SSHKit.config.command_map[:bower] = File.join(current_path, 'node_modules', 'bower', 'bin', "bower")
SSHKit.config.command_map[:grunt] = File.join(current_path, 'node_modules', 'grunt-cli', 'bin', "grunt")

namespace :yo do 
  # task :set_path do 
  #   SSHKit.config.default_env[:path] += [
  #     "#{shared_path}/node_modules/bower/bin", 
  #     "#{shared_path}/node_modules/grunt-cli/bin",
  #   ]
  # end

  task :install do
    on roles(:app), in: :sequence, wait: 5 do 
      within release_path do 
        unless test "[ -d #{File.join(current_path, 'node_modules', 'grunt-cli', 'bin')} ]"
          execute :npm, "install yo"
        end
      end
    end
  end

  task :build do
    invoke 'yo:install'
    invoke 'npm:install'
    invoke 'bower:install'
    invoke 'grunt:build'
  end
end


namespace :npm do 
  task :install do
    on roles(:app), in: :sequence, wait: 5 do 
      within release_path do 
        execute :npm, "install"
      end
    end
  end
end

namespace :bower do
  task :install do
    on roles(:app), in: :sequence, wait: 5 do 
      within release_path do 
        execute :bower, "install"
      end
    end
  end
end

namespace :grunt do
  task :build do
    on roles(:app), in: :sequence, wait: 5 do 
      within release_path do 
        execute :grunt, "build"
      end
    end
  end
end
