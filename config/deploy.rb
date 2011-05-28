# require 'bundler/capistrano'

set :application, "sc2progress"
set :repository,  "git://github.com/keikun17/sc2progress.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
server "malayancolleges.com", :app, :web, :db, :primary => true

set :user, "deploy"
set :password, "t3n3n!"

set :ssh_options, { :forward_agent => true }
set :use_sudo, false
set :deploy_to, "/opt/apps/#{application}"
set :rails_env, "production"
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# bundler
namespace :bundler do
  task :install do
    run("gem install bundler --source=http://gemcutter.org")
  end
  
  task :symlink_vendor do
  shared_gems = File.join(shared_path, 'vendor/bundler_gems')
  release_gems = "#{release_path}/vendor/bundler_gems/"
    %w(cache gems specifications).each do |sub_dir|
      shared_sub_dir = File.join(shared_gems, sub_dir)
      run("mkdir -p #{shared_sub_dir} && mkdir -p #{release_gems} && ln -s #{shared_sub_dir} #{release_gems}/#{sub_dir}")
    end
  end

  task :bundle_new_release do
    bundler.symlink_vendor
    rails_env = variables[:rails_env] || 'production'
    run("cd #{release_path} && bundle install --only #{rails_env}")
  end
  
end

after 'deploy:update_code', 'bundler:bundle_new_release'