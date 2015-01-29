desc 'Initial scrape'
task scrape: :environment do
  FullScrapeJob.new.perform
  LatestScrapeJob.new.perform
end