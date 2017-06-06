namespace :yield_curve_snapshots do
  desc 'Retrieves the latest data from the Treasury'
  task :update => :environment do
    Treasury::FetchAndStoreYieldCurve.(month: Date.today.month, year: Date.today.year)
  end

  task :run_update_daemon => :environment do
    Daemons::UpdateYieldCurve.run

    while
      sleep 100
    end
  end
end