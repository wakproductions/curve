server 'ycurve-production', user: 'ubuntu', roles: %w{web app db}

namespace :custom do
  task :setup_container do
    on roles(:web) do |host|
      puts "================Starting Docker setup===================="
      execute "sudo docker stop $(docker-compose ps -q web); echo 0"
      execute "docker rm $(docker ps -a | grep #{fetch(:docker_container_name)} | awk \"{print \$1}\"); echo 0"

      # Working directory hack
      # https://stackoverflow.com/questions/19452983/capistrano-3-execute-within-a-directory
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose build"
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose up -d"

      # Run the daemons
      execute "cd #{fetch(:deploy_to)}/current; sudo docker-compose run -d web bundle exec rake yield_curve_snapshots:run_update_daemon"
    end
  end
end

after "deploy:published", "custom:setup_container"
