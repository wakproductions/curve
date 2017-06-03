server 'ycurve-production', user: 'ubuntu', roles: %w{web app db}

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      # execute "cd #{fetch(:deploy_to)}/current"
      execute "sudo docker stop #{fetch(:docker_container_name)}; echo 0"
      execute "sudo docker rm -fv #{fetch(:docker_container_name)}; echo 0"
      
      # Working directory hack
      # https://stackoverflow.com/questions/19452983/capistrano-3-execute-within-a-directory
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose build"
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose up -d"
    end
  end
end

after "deploy:published", "custom:setup_container"
