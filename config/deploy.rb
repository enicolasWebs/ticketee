require 'bundler/capistrano'
require 'puma/capistrano' 
require 'rvm/capistrano'

set :user, 'vagrant'
set :use_sudo, false
set :bundle_without, [:development, :test, :production]

set :application, "ticketee"
set :repository,  "https://github.com/enicolasWebs/ticketee.git"

set :ssh_options, {port: 2222,
                                      keys: ['~/.vagrant.d/insecure_private_key']}
set :deploy_to, "/home/#{user}/#{application}"

set :deploy_via, :remote_cache
set :rails_env, 'vagrant_production'

server "localhost", :app, :web, :db, :primary => true

before "deploy:assets:precompile", "preconfigure"
task :preconfigure, :roles => :db do
      run("cd #{release_path} && 
              RAILS_ENV=vagrant_production bundle exec rake db:migrate")
end

