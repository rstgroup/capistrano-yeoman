namespace :config do
  task :set_paths do
    SSHKit.config.command_map[:bower] = File.join(release_path, 'node_modules', 'bower', 'bin', "bower")
    SSHKit.config.command_map[:grunt] = File.join(release_path, 'node_modules', 'grunt-cli', 'bin', "grunt")
  end
end

namespace :yo do
  task :install do
    on roles(:app) do
      within release_path do
        unless test "[ -d #{File.join(current_path, 'node_modules', 'grunt-cli', 'bin')} ]"
          execute :npm, "install yo"
        end
      end
    end
  end

  task :build do
    invoke 'config:set_paths'
    invoke 'yo:install'
    invoke 'npm:install'
    invoke 'bower:install'
    invoke 'grunt:build'
  end
end

namespace :npm do
  task :install do
    on roles(:app) do
      within release_path do
        execute :npm, "install"
      end
    end
  end
end

namespace :bower do
  task :install do
    on roles(:app) do
      within release_path do
        execute :bower, "install"
      end
    end
  end
end

namespace :grunt do
  task :build do
    on roles(:app) do
      within release_path do
        execute :grunt, "build"
      end
    end
  end
end
