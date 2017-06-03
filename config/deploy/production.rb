server 'ycurve-production', user: 'ubuntu', roles: %w{web app db}

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      execute "cd #{fetch(:deploy_to)}/current"
      execute "sudo docker stop #{fetch(:docker_container_name)}; echo 0"
      execute "sudo docker rm -fv #{fetch(:docker_container_name)}; echo 0"
      execute "sudo docker-compose build"
      execute "sudo docker-compose up -d"
    end
  end
end

after "deploy:published", "custom:setup_container"
