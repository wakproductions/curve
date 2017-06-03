server 'wak-ustreasuryyieldcurve-production', user: 'ubuntu', roles: %w{web app db}

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      execute "cd #{deploy_to}/current"
      execute "docker stop #{fetch(:docker_container_name)}; echo 0"
      execute "docker rm -fv #{fetch(:docker_container_name)}; echo 0"
      execute 'docker-compose build && docker-compose up'
    end
  end
end

after "custom:setup_container"
