# config valid only for Capistrano 3.1
lock '3.4.0'
#load File.expand_path('../recipes/my_new_thing.rb', __FILE__)
set :application, 'task_chat'
set :repo_url, 'git@github.com:kuranovandry/task_chat.git'

# Default branch is :master
current_branch = `git branch`.match(/\* (\S+)\s/m)[1]
set :branch, ENV['branch'] || current_branch || "master"
# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/task_chat'

# Default value for :scm is :git
set :scm, :git
# Default value for :format is :pretty
# set :format, :pretty
set :rvm_type, :system
set :rvm_ruby_version, '2.2.2'
# Default value for :log_level is :debug

# Default value for :pty is false
# set :pty, true
# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/uploads}
set :hosts, 'hosts'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles (:all) do
    execute "cd #{release_path}; touch tmp/restart.txt"
    end
  end
  task :setup_config do
    on roles (:all) do
    execute :mkdir, "-p #{shared_path}/config; true"
    upload! 'config/database.yml', '/tmp/database.yml'
    upload! 'config/secrets.yml', '/tmp/secrets.yml'
    execute "mv /tmp/database.yml #{shared_path}/config/"
    execute "mv /tmp/secrets.yml #{shared_path}/config/"
    end
  end
  task :db_seed do
    on roles (:db) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:seed'
        end
      end
    end
  end
end

namespace :logs do
  desc "tail rails logs"
  task :tail_rails do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end
end

after :deploy, 'deploy:restart'

