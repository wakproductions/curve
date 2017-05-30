namespace :yield_curve_snapshots do
  desc 'Retrieves the latest data from the Treasury'
  task :update => :environment do
    Treasury::FetchAndStoreYieldCurve.(month: Date.today.month, year: Date.today.year)
  end
end