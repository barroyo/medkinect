set :application, "medkinect"
set :repository,  "git@github.com:barroyo/medkinect.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :db, "medkinect", :primary => true                          # Your HTTP server, Apache/etc
set :user, "ubuntu"
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/home/ubuntu/www/#{application}"
set :deploy_subdir, 'server'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
#after 'deploy:update', 'bundle:install', 'deploy:migrate'

after "deploy:restart","deploy:update_swf"
#after 'deploy:update_code', 'deploy:migrate'


namespace :deploy do

  task :restart do
    run "sudo /etc/init.d/apache2 restart"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:migrate RAILS_ENV=#{rails_env}"
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
