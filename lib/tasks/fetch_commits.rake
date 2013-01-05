namespace :commits do
  desc 'fetches commits'
  task :fetch => :environment do
    Fetch::FetchService.fetch_all!
  end
end
