server 'wak-ustreasuryyieldcurve-production', user: 'ubuntu', roles: %w{web app db}

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      execute "cd #{deploy_to}/current"
      execute "docker stop #{fetch(:docker_container_name)}; echo 0"
      execute "docker rm -fv #{fetch(:docker_container_name)}; echo 0"
      execute 'docker-compose build && docker-compose up'
      execute "docker exec -it #{fetch(:docker_container_name)} bundle exec rake db:migrate"
    end
  end
end

after "deploy:finishing", "custom:setup_container"
