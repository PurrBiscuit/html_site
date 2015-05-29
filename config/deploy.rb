set :application, 'purrbiscuit'
set :repo_url, 'git@github.com:stephenpurr/purrbiscuit.git'
set :deploy_to, '/var/www/purrbiscuit.com'
set :user, 'app'

namespace :deploy do

  desc 'Clean up files we don\'t want'
  task :remove_deploy do
    on roles :app do
      if test("[ -d #{File.join(release_path, "config")} ]")
        execute "rm -r #{release_path}/config"
      end
      if test("[ -f #{File.join(release_path, "Capfile")} ]")
        execute "rm #{release_path}/Capfile"
      end
    end
  end

  after :finishing, :remove_deploy

end
