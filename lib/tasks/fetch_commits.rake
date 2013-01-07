namespace :commits do
  desc 'fetches commits'
  task :fetch => :environment do
    Fetchers::FetchService.fetch_all!
  end
end
